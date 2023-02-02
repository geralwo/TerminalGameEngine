module TGE
        class Component
                attr_reader :name, :type
                def initialize name, type
                        @name = name
                        @type = type
                end

                def update
                        warn "update not implemented #{self}" if $DEBUG == true
                end

                def on_ready
                        warn "on_ready not implemented #{self}" if $DEBUG == true
                end
        end
end