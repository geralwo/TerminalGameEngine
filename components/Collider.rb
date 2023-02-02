module TGE
        class Collider < Component
                attr_reader :shape, :size
                def initialize shape, size
                        super :collider, 'Collider'
                        @shape = shape
                        @size = size
                end

                def update

                end
        end
end
