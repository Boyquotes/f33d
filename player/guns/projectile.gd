extends CharacterBody2D
class_name Projectile

var shoot = true

const DAMAGE = 50
const SPEED = 500
const ACCELERATION = 2000
const LIFETIME = 5
@onready var lifetimer = $Lifetimer


func _ready():
	set_as_top_level(true)
	lifetimer.start(LIFETIME)
	
func _physics_process(delta):
	move_and_slide()
	if shoot:
		velocity = velocity.move_toward(Vector2(transform.y.y,-transform.y.x) * SPEED, delta * ACCELERATION)

func _on_area_2d_body_entered(body):
	if body is Enemy:
		body.take_damage(DAMAGE)
		queue_free()
	else:
		queue_free()


func _on_lifetimer_timeout():
	queue_free()
