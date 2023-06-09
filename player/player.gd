extends RigidBody2D
class_name Player

@export var state : Player_state

var move_dir: Vector2
var target: Vector2
var view_dir: Vector2
@onready var guns = $Guns
@onready var raycast = $RayCast2D

func _ready():
	pass



func _physics_process(delta):
	_move()
	

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("click") or Input.is_action_pressed("space"):
		_fire()
	move_dir = Input.get_vector("a", "d", "w", "s")
	
func _move() -> void:
	apply_central_force(move_dir*state.speed)
	target = get_global_mouse_position()
	view_dir = (target - self.position)
	view_dir = view_dir.normalized()
	rotation = atan2(view_dir.y, view_dir.x) + PI/2
	
	
func _fire() -> void:
	guns.get_child(0).shot(self)
