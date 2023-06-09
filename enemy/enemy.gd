extends RigidBody2D
class_name Enemy

@export var state : Enemy_state


func _physics_process(delta):
	pass

func take_damage(DAMAGE):
	state.hp -= DAMAGE
	if state.hp <= 0:
		death()
	
	
func death():
	queue_free()
