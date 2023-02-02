module TGE
require_relative 'Entity'
require_relative 'Component'
Dir[File.join(__dir__, 'components', '*.rb')].each { |file| require file }
require_relative 'Screen'
require_relative 'Input'
require_relative 'Physics'
require 'io/console'
        $Entities = []
        @quit_game = false
        $Tick = 0
        $FPS = 144
        Input = TGE::Input.new
        Physics = TGE::Physics.new
        Width = `tput cols`.to_i
        Height = `tput lines`.to_i

        def self.new
                print "\e[2J\e[f"
                $Screen = TGE::Screen.new
                return self
        end

        def self.loop &block
                begin
                        system('stty raw -echo')
                        while not @quit_game
                                Input.collect_input
                                exit if Input.key_pressed == "Q"
                                block.call
                                Physics.step $Entities
                                $Entities.each do |entity|
                                        entity.update
                                        $Screen.draw_pixel entity[:pos].x, entity[:pos].y, entity[:texture].texture
                                end
                                $Tick = $Tick + 1
                                sleep 1.0 / $FPS
                        end
                ensure
                        system('stty -raw echo')
                end
        end

        def self.draw_pixel x,y,z
                $Screen.draw_pixel x,y,z
        end

        def self.add_game_object game_object
                $Entities << game_object
        end
end