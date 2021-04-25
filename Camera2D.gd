extends Camera2D

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
		print(vel)
		if(vel.x<1.5 and vel.y<1):
			GameGlobal.gamestate=GameGlobal.Gamestates.resetting
			GameGlobal.current_ball.sleeping=true
			GameGlobal.current_ball=null
			
			
func reset_camera(): 
	self.position.x=lerp(self.position.x,GameGlobal.intialcampos.x,0.02)
	print("x1:"+str(round(self.position.x))+" x2:"+str(round(GameGlobal.intialcampos.x)))
	if(round(self.position.x)==round(GameGlobal.intialcampos.x)):
		GameGlobal.gamestate=GameGlobal.Gamestates.idle

	
