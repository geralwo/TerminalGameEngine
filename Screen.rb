
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
                        @ScreenPixels = {}
                end

                def draw_pixel x,y,p
                        print "\e[#{y};#{x}H#{p}"
                end

                def update entities
                        # system 'clear' # bad
                        entities.each do |ent|
                                pos = Vector::Vector2.new ent[:Position].x, ent[:Position].y
                                @ScreenPixels[pos] = ent[:Pixel]
                                @ScreenPixels[pos].needs_update = true
                        end
                        @ScreenPixels.each { |k,v|
                                # if v.needs_update
                                        self.draw_pixel k.x,k.y, v.char
                                        # v.needs_update = false
                                # end
                        }
                end
        end
end             
