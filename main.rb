require_relative 'TGE'

game = TGE.new 

entity = TGE::Entity.new "player"
entity.add_component TGE::Position.new 0,0
entity.add_component TGE::Pixel.new "@"
game.add_game_object entity


entity2 = TGE::Entity.new "tree"
entity2.add_component TGE::Position.new 23,5
entity2.add_component TGE::Pixel.new "T"
game.add_game_object entity2

game.loop do
        case TGE::Input.key_pressed
        when "w"
                entity[:Position].y -= 1 unless entity[:Position].y == 0
                
        when "s"
                entity[:Position].y += 1 unless entity[:Position].y > TGE::Height
        when "a"
                entity[:Position].x -= 1 unless entity[:Position].x == 0
        when "d"
                entity[:Position].x += 1 unless entity[:Position].x > TGE::Width
        end
        $Logger.debug_warn "#{entity[:Position].to_s}"
end