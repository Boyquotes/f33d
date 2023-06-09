extends Node2D
class_name Gun

var damage = 10
var reload_time = 1
var is_reloaded = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shot(raycast, player):
	pass




func _on_reloading_timeout():
	is_reloaded = true
