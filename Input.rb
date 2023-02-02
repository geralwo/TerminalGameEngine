require 'io/console'
module TGE
        class Input
                KEYCODES = {
                        65 => 'A',
                        66 => 'B',
                        67 => 'C',
                        68 => 'D',
                        69 => 'E',
                        70 => 'F',
                        71 => 'G',
                        72 => 'H',
                        73 => 'I',
                        74 => 'J',
                        75 => 'K',
                        76 => 'L',
                        77 => 'M',
                        78 => 'N',
                        79 => 'O',
                        80 => 'P',
                        81 => 'Q',
                        82 => 'R',
                        83 => 'S',
                        84 => 'T',
                        86 => 'U',
                        87 => 'V',
                        88 => 'W',
                        89 => 'X',
                        90 => 'Y',
                        91 => 'Z',
                        97 => 'a',
                        98 => 'b',
                        99 => 'c',
                        100 => 'd',
                        101 => 'e',
                        102 => 'f',
                        103 => 'g',
                        104 => 'h',
                        105 => 'i',
                        106 => 'j',
                        107 => 'k',
                        108 => 'l',
                        109 => 'm',
                        110 => 'n',
                        111 => 'o',
                        112 => 'p',
                        113 => 'q',
                        114 => 'r',
                        115 => 's',
                        116 => 't',
                        117 => 'u',
                        118 => 'v',
                        119 => 'w',
                        120 => 'x',
                        121 => 'y',
                        122 => 'z',
                }
                attr_reader :key_pressed, :key_code
                def initialize
                        @key_code = nil
                        @key_pressed = nil
                end

                def collect_input
                        @key_pressed = nil
                        @key_code = (STDIN.read_nonblock(1).ord rescue nil) #unless nil
                        @key_pressed = KEYCODES[@key_code] unless @key_code == nil
                end
        end
end