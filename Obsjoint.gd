extends PinJoint2D
func _input(event):
	if(event is InputEventMouseButton):
		if(event.button_index==BUTTON_LEFT):
			self.node_a=".../"
			
		
