extends TextureButton

onready var CrowbarBase=get_parent().get_node("Catapult/CrowbarBase")
onready var Camera=get_parent().get_node("Camera2D")
func _ready():
	GameGlobal.intialcampos=Camera.position

func _pressed():
	var ball=preload("res://Ball.tscn").instance()
	if(GameGlobal.gamestate==GameGlobal.Gamestates.idle):
		generate(ball)
	if(GameGlobal.gamestate==GameGlobal.Gamestates.ball_fail):
		var ball_to_remove=get_parent().get_node("Ball")
		if(ball_to_remove!=null):
			ball_to_remove.queue_free()
		GameGlobal.gamestate=GameGlobal.Gamestates.idle
		GameGlobal.current_ball=null
		#generate(ball)
func generate(ball):
	if(GameGlobal.gamestate==GameGlobal.Gamestates.idle):
		GameGlobal.current_ball=ball
		get_parent().add_child(ball)
		GameGlobal.intialballpos=ball.position
		GameGlobal.gamestate=GameGlobal.Gamestates.ball_kept
		print("ADD")
	
