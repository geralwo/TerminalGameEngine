require_relative 'TGE'

game = TGE.new 

entity = TGE::Entity.new "player"
entity.add_component TGE::Position.new 0,0
entity.add_component TGE::Texture.new "@"
entity.add_component TGE::Collider.new :box, 1
game.add_game_object entity


entity2 = TGE::Entity.new "tree"
entity2.add_component TGE::Position.new 23,5
entity2.add_component TGE::Texture.new "T"
game.add_game_object entity2

game.loop do
        case TGE::Input.key_pressed
        when "w"
                entity[:pos].y -= 1 unless entity[:pos].y == 0
        when "s"
                entity[:pos].y += 1 unless entity[:pos].y > TGE::Height
        when "a"
                entity[:pos].x -= 1 unless entity[:pos].x == 0
        when "d"
                entity[:pos].x += 1 unless entity[:pos].x > TGE::Width
        end
end