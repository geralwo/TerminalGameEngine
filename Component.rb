module TGE
        class Component
                attr_reader :name
                def initialize name
                        @name = name.split('::').last.to_sym
                end

                def update
                        warn "update not implemented #{self}"
                end

                def on_ready
                        warn "on_ready not implemented #{self}"
                end
        end
end