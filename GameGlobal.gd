extends Node
var canshoot=true
enum Gamestates{idle,ball_kept,ball_shoot,ball_shooting,resetting,ball_fail}
var gamestate=Gamestates.idle
var current_ball:RigidBody2D=null
var intialballpos:Vector2=Vector2(0,0)
var intialcampos:Vector2=Vector2(0,0)
func load_castle(num,world):
	if(num==1):
		var castle_res=load("res://Castle1.tscn")
		var castle=castle_res.instance()
		world.add_child(castle)

		castle.position.x=1560
		castle.position.y=520
		
