module TGE
        class Texture < Component
                attr_accessor :texture
                def initialize texture
                        super :texture, 'Texture'
                        @texture = texture
                end
        end
end