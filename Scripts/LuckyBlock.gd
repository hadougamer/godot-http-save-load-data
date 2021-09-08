extends KinematicBody2D

func _on_BottomArea_body_entered( body ):
	if body.is_in_group('hero'):
		$Player.play('Hit')
		$"..".addScore()
		if( $"..".player_score > $"..".hiscore ):
			Api.set_req( $"../HTTPPost" )
			Api.save_score(
				$"..".player_name, 
				$"..".player_score, 
				$"..", 
				"_reload_score"
			)
