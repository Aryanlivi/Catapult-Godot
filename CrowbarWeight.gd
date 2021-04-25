extends RigidBody2D
const Infinity = 3.402823e+38
func _ready():
	#Engine.time_scale=1.3
	pass
	#self.inertia=Infinity
onready var CrowbarObs=get_parent().get_node("CrowbarObs/Obsjoint")
onready var button=get_parent().get_parent().get_node("SelectStone")

 
func _input(event):
	if(event is InputEventMouseButton):
		if(event.button_index==BUTTON_LEFT and event.pressed and GameGlobal.gamestate==GameGlobal.Gamestates.ball_kept):
			#GameGlobal.current_ball.get_node("CollisionShape2D").disabled=false
			
			self.applied_force=Vector2(0,10000)
			GameGlobal.gamestate=GameGlobal.Gamestates.ball_shoot
			
		if(event.button_index==BUTTON_LEFT and event.pressed==false and GameGlobal.gamestate==GameGlobal.Gamestates.ball_shoot):
			self.applied_force=Vector2(0,0)
			GameGlobal.gamestate=GameGlobal.Gamestates.ball_shooting
			print("STOP")
		

