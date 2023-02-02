module TGE
        class Screen
                attr_reader :Width, :Height
                attr_accessor :ScreenPixels

                Vec2 = Struct.new :x,:y

                def initialize
                        @Width = TGE::Width
                        @Height = TGE::Height
                        @ScreenPixels = {}
                end

                def draw_pixel x,y,p
                        print "\e[#{y};#{x}H#{p}"
                        @ScreenPixels[Vec2.new x,y] = p
                end

                def render
                        for y in @Height
                                for x in @Width                                 
                                        self.draw_pixel x,y, @ScreenPixels[Vec2.new x,y]
                                end
                        end
                end
        end
end             
