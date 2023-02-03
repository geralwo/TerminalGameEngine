
require_relative 'Vector'
require_relative 'components/Pixel'
include Vector
module TGE
        class Screen
                attr_reader :Width, :Height
                attr_accessor :ScreenPixels

                def initialize width = TGE::Width, height = TGE::Height
                        @Width = width
                        @Height = height
                        
                end

                def clear_screen
                        print "\033[2J"
                end
                
                def disable_cursor
                        print "\x1B[?25l"
                end
                
                def enable_cursor
                        print "\x1B[?25h"
                end

                def draw_pixel x,y,p
                        print "\e[#{y};#{x}H#{p}"
                end

                def update entities
                        screenPixels = Hash.new { |hash,key| hash[key] = TGE::Pixel.new "█"}
                        entities.each do |ent|
                                pos = Vector::Vector2.new ent[:Position].x, ent[:Position].y
                                screenPixels[pos] = ent[:Pixel]
                                screenPixels[pos].needs_update = true
                        end
                        screenPixels.each { |k,v|
                                if v.needs_update
                                        self.draw_pixel k.x,k.y, v.char
                                        v.needs_update = false
                                end
                        }
                end
        end
end             
