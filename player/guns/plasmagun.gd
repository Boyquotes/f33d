extends Gun

@onready var projectile = preload("res://player/guns/projectile.tscn")


func _ready():
	reload_time = 0.3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shot(player):
	if is_reloaded:
		is_reloaded = false
		var b = projectile.instantiate()
		b.set_global_position(get_global_position())
		b.look_at(player.get_global_position() + player.view_dir)
		b.velocity = player.linear_velocity
		add_child(b)
		b.shoot = true
		$Reloading.start(reload_time)
