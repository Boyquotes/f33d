extends TileMap

const MAP_SIZE : int = 512
var noise = FastNoiseLite.new()
var noise2 = FastNoiseLite.new()
var noise3 = FastNoiseLite.new()

var r_square : int


func _ready():
	
	clear()
	
	noise.set_seed(1151)
	noise.set_frequency(0.01)
	noise.set_noise_type(noise.TYPE_SIMPLEX_SMOOTH)
	
	noise2.set_frequency(0.03)
	
	for i in range(MAP_SIZE):
		for j in range(MAP_SIZE):
			r_square = (i-MAP_SIZE/2)**2 + (j-MAP_SIZE/2)**2
			if r_square <= 64000:
				if noise.get_noise_2d(i,j) > -0.2 and 0.2 > noise.get_noise_2d(i,j):
					if noise2.get_noise_2d(i,j) > -0.2 and 0.2 > noise2.get_noise_2d(i,j):
						_set_cell(Vector2i(i,j), Vector2i(0,0))
					else:
						_set_cell(Vector2i(i,j), Vector2i(0,1))
				else:
					_set_cell(Vector2i(i,j), Vector2i(1,0))
				if r_square <= 128:
					_set_cell(Vector2i(i,j), Vector2i(0,0))



func _process(delta):
	pass
	
func _set_cell(map_pos: Vector2i, atlas_pos : Vector2i):
	set_cell(0, Vector2i(map_pos.x-MAP_SIZE/2,map_pos.y-MAP_SIZE/2), 0, atlas_pos)
	
