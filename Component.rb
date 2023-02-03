module TGE
        class Component
                attr_reader :name
                def initialize name
                        @name = name.split('::').last.to_sym
                end

                def update
                        warn "update() not implemented for #{self}"
                end

                def on_ready
                        warn "on_ready() not implemented for #{self}"
                end
        end
end