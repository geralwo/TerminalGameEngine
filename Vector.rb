module Vector
        Vector2 = Struct.new :x, :y do
                def initialize x = 0, y = 0
                  self.x = x
                  self.y = y
                end
              
                def add vec2
                  if vec2.instance_of? Vector2
                    self.x = self.x + vec2.x
                    self.y = self.y + vec2.y
                    return self
                  end
                end
        
                def scalar_mul num
                    res = Vector2.new
                    res.x = self.x * num
                    res.y = self.y * num
                    return res
                end
        
                def dot vec2
                  if vec2.instance_of? Vector2
                    dot = (self.x * vec2.x) + (self.y * vec2.y)
                    return dot
                  end
                end
        
                def cross vec2
                  if vec2.instance_of? Vector2
                    cross = (self.x * vec2.y) - (self.y * vec2.x)
                    return cross
                  end
                end

                alias scale scalar_mul
        end

        def vec2 x,y
          return Vector2.new x,y
        end

        Vector3 = Struct.new :x, :y, :z do
                def initialize x,y,z
                        puts "not implemented"
                end
        end
end


# include Vector

# pos = Vector2.new 3,7
# puts pos
# puts pos.add pos
# puts pos.scalar_mul 3
# puts pos.scale 2
# puts pos.dot pos
# puts pos.cross pos
