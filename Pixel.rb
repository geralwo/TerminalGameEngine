module TGE
        Pixel = Struct.new :char, :color do 
                def initialize char, fg = nil, bg = nil
                        @char = char
                        @fg = fg
                        @bg = bg
                end
        end
end