module TGE
        class Physics
                def step ents
                        ents.each do |ent|
                                if ent.has_component? :collider
                                        ent[:collider].size.times do |x|
                                                ent[:collider].size.times do |y|
                                                # check nearby cells for colisions
                                                end
                                        end
                                end
                        end
                end
        end
end