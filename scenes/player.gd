extends Node2D

@export var speed: int = 500;

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(1280 / 2, 720 / 2);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down");
	print(direction)
	position += direction * speed * delta;
	
	if Input.is_action_pressed("rotate_left"):
		rotation -= 0.2 * 20 * delta;
	
	if Input.is_action_pressed("rotate_right"):
		rotation += 0.2 * 20 * delta;
	#if Input.is_action_just_pressed("ui_down"):
		#
		#position += Vector2(1, 0) * 150 * delta;
		#$PlayerImage.rotation += 6.5 * delta
