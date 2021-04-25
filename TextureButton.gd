extends TextureButton

onready var CollisionArea=get_parent().get_node("Catapult/CrowbarObs/Area2D")
onready var CrowbarObs=get_parent().get_node("Catapult/CrowbarObs")
onready var CrowbarBase=get_parent().get_node("Catapult/CrowbarBase")
onready var Camera=get_parent().get_node("Camera2D")
func _ready():
	GameGlobal.intialcampos=Camera.position

func _pressed():
	#var ball=get_parent().get_node("Ball")
	var ball=preload("res://Ball.tscn").instance()
	#ball.get_node("CollisionShape2D").disabled=true
	if(GameGlobal.gamestate==GameGlobal.Gamestates.idle):
		generate(ball)
		print("GENERATE")
		
func generate(ball):
	var CollidingBodies=CollisionArea.get_overlapping_bodies()
#	CollidingBodies[0]==CrowbarBase && CollidingBodies[1]==CrowbarObs and
	if(GameGlobal.gamestate==GameGlobal.Gamestates.idle):
		#CrowbarBase.mode=MODE_STATIC
		#ball.mode=1
		GameGlobal.current_ball=ball
		#GameGlobal.current_ball.z
		get_parent().add_child(ball)
		GameGlobal.intialballpos=ball.position
	
		GameGlobal.gamestate=GameGlobal.Gamestates.ball_kept
		print("ADD")
