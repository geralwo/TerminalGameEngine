module TGE
        class Pixel < Component
                attr_accessor :needs_update, :char, :fg, :bg
                def initialize char, fg = nil, bg = nil
                        @char = char
                        @fg = fg
                        @bg = bg
                        @needs_update = true
                end

                def update
                end
        end
end
