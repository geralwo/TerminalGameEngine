module TGE
        class Position < Component
                attr_accessor :x, :y, :z
                def initialize x = 0, y = 0, z = 0
                        super :pos, 'Position2D'
                        @x = x
                        @y = y
                        @z = z
                end
        end
end