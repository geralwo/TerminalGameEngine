module TGE
        require_relative 'Screen'
        class Log
                def initialize params = {}
                        @file_path = params[:file_path]
                end

                def debug_warn msg
                        if @file_path != nil
                                #write to file
                        else
                                Screen.new.draw_pixel 0, TGE::Height, "\e[2K"
                                Screen.new.draw_pixel 0, TGE::Height, msg
                        end
                        
                end
        end
end