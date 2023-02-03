module TGE
        require_relative 'Vector'
        require_relative 'Entity'
        require_relative 'Component'
        Dir[File.join(__dir__, 'components', '*.rb')].each { |file| require file }
        require_relative 'Screen'
        require_relative 'Input'
        require_relative 'Physics'
        require_relative 'Log'
        require 'io/console'

        $Entities = []
        $DEBUG = false
        @quit_game = false
        $Tick = 0
        $FPS = 60
        Input = TGE::Input.new
        Physics = TGE::Physics.new
        $Logger = TGE::Log.new
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
                        $Screen.disable_cursor
                        while not @quit_game
                                $Screen.clear_screen
                                Input.collect_input
                                exit if Input.key_pressed == "Q"
                                block.call
                                $Entities.each do |entity|
                                        entity.update
                                end
                                $Screen.update $Entities.select { |ent| ent.has_component? :Pixel}
                                $Tick = $Tick + 1
                                sleep 1.0 / $FPS
                        end
                ensure
                        $Screen.enable_cursor
                        print "\e[0;0\e[2K\e[2J"
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