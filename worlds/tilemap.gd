extends TileMap

const MAP_SIZE : int = 256
var noise = FastNoiseLite.new()


func _ready():
	clear()
	noise.set_seed(Time.get_unix_time_from_system())

	for i in range(MAP_SIZE):
		for j in range(MAP_SIZE):
			var r_square = (i-MAP_SIZE/2)**2 + (j-MAP_SIZE/2)**2
			if r_square <= 10000:
				var noise_value = noise.get_noise_2d(i,j)
				if noise_value > -0.2 and 0.2 > noise_value:
					set_cell(0, Vector2i(i-MAP_SIZE/2,j-MAP_SIZE/2), 0, Vector2i(0,0))
				else:
					set_cell(0, Vector2i(i-MAP_SIZE/2,j-MAP_SIZE/2), 0, Vector2i(1,0))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
