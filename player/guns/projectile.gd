extends RigidBody2D
class_name Projectile

var shoot = true

const DAMAGE = 10
const SPEED = 200

func _ready():
	set_as_top_level(true)
	
func _physics_process(delta):
	if shoot:
		apply_central_force(Vector2(transform.y.y,-transform.y.x) * SPEED) 


