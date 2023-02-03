
require_relative 'Vector'
require_relative 'components/Pixel'
include Vector
module TGE
        class Screen
                attr_reader :Width, :Height
                attr_accessor :ScreenPixels

                def initialize
                        @Width = TGE::Width
                        @Height = TGE::Height
                        @ScreenPixels = {}
                        @Width.times do |x|
                                @Height.times do |y|
                                        @ScreenPixels[vec2 x,y] = TGE::Pixel.new "#"
                                end
                        end
                end

                def draw_pixel x,y,p
                        print "\e[#{y};#{x}H#{p}"
                end

                def update entities
                        entities.each do |ent|
                                @ScreenPixels[vec2 ent[:Position].x, ent[:Position].y] = ent[:Pixel]
                                @ScreenPixels[vec2 ent[:Position].x, ent[:Position].y].needs_update = true
                        end
                        @ScreenPixels.each { |k,v|
                                if v.needs_update
                                        self.draw_pixel k.x,k.y, v.char
                                        v.needs_update = false
                                end
                        }
                end
        end
end             
