module TGE
        class Position < Component
                attr_accessor :x, :y, :z
                def initialize x = 0, y = 0, z = 0
                        super self.class.name
                        @x = x
                        @y = y
                        @z = z
                end

                def update
                end

                def to_s
                        "#{@x},#{@y},#{@z}"
                end
        end
end