module TGE
        class Entity
                attr_reader :name
                attr_accessor :components
                def initialize name
                        @name = name
                        @components = {}
                end

                def add_component component
                        @components[component.name] = component
                end

                def [](key)
                        @components[key]
                end

                def has? key
                        return @components[key] if @components[key] != nil
                end

                def update
                        @components.each do |k,v|
                                p v if $DEBUG == true
                                @components[k].update
                        end
                end

                def draw
                        return @components[:texture]
                end

                def on_ready
                        @components.each do |component|
                                component.on_ready
                        end
                end
        end
end