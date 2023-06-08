extends RigidBody2D
class_name Player

@export var state : Player_state

var move_dir: Vector2
var target: Vector2
var view_dir: Vector2


func _ready():
	pass



func _physics_process(delta):
	_move()



func _move() -> void:
	move_dir = Input.get_vector("a", "d", "w", "s")
	apply_central_force(move_dir*1000)
	target = get_global_mouse_position()
	view_dir = (target - self.position)
	view_dir.normalized()
	rotation = atan2(view_dir.y, view_dir.x) + PI/2
	
	
func _fire() -> void:
	pass
