extends Camera2D
onready var CrowbarBase=get_parent().get_node("Catapult/CrowbarBase")
func _process(delta):
	var player=GameGlobal.current_ball
	if(GameGlobal.gamestate==GameGlobal.Gamestates.ball_shooting):
		var newX=lerp(self.position.x,GameGlobal.intialcampos.x+player.position.x-GameGlobal.intialballpos.x,0.1)
		newX=clamp(newX,0,2050)
		self.position.x=newX

func _physics_process(delta):
	if(GameGlobal.gamestate==GameGlobal.Gamestates.resetting):
		reset_camera()
	if(GameGlobal.gamestate==GameGlobal.Gamestates.ball_shooting):
		var vel=GameGlobal.current_ball.linear_velocity
		#print(vel)
		if(vel.x<1.5 and vel.y<1):
			GameGlobal.gamestate=GameGlobal.Gamestates.resetting
			GameGlobal.current_ball.sleeping=true
			#GameGlobal.current_ball=null
func reset_camera(): 
	self.position.x=lerp(self.position.x,GameGlobal.intialcampos.x,0.02)
	#print("x1:"+str(round(self.position.x))+" x2:"+str(round(GameGlobal.intialcampos.x)))	
	if(round(self.position.x)==round(GameGlobal.intialcampos.x)):
		var bodies:Array=GameGlobal.current_ball.get_colliding_bodies()
		print("Reset")
		if(bodies.size()==0):
			GameGlobal.gamestate=GameGlobal.Gamestates.idle
			GameGlobal.current_ball=null
		if(bodies[0].name=="CrowbarBase" or bodies[0].name=="CrowbarHeadA" or bodies[0].name=="CrowbarHeadB"):
			GameGlobal.gamestate=GameGlobal.Gamestates.ball_fail
			print("fail")
		else:
			GameGlobal.gamestate=GameGlobal.Gamestates.idle
			GameGlobal.current_ball=null
			print("idle")

	
