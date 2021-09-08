extends Node2D

var req:HTTPRequest

var player_name:String = "Hadou"
var player_score:int=0
var hiscore:int
var reloaded = false

func _ready():
	Api.set_req( $HTTPLoad )
	Api.list_score(self, "_show_score")

func addScore():
	player_score += 10

func _process(delta):
	$"Interface/Control/Score".text = str(player_score)

func _reload_score(result, response_code, headers, body):
	if response_code == 200:
		Api.set_req( $HTTPLoad )
		Api.list_score(self, "_show_score")

func _show_score(result, response_code, headers, body):
	body.get_string_from_utf8()
	var json = JSON.parse(body.get_string_from_utf8())
	hiscore = int(json.result[0].score)
	
	# Sets the interface score
	var name = json.result[0].name
	var score = json.result[0].score
	$"Interface/Control/Hiscore".text = str(name) + " : " + str(score) 

