module TGE
        class Pixel < Component
                attr_accessor :needs_update, :char, :fg, :bg
                def initialize char, fg = nil, bg = nil, needs_update = true
                        super self.class.name
                        @char = char
                        @fg = fg
                        @bg = bg
                        @needs_update = needs_update
                end

                def update
                end
        end
end
