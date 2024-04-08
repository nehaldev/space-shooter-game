extends Area2D

@export var speed = 500;

func _ready():
	#$LaserImage.scale = Vector2(0,0);
	var tween = create_tween();
	tween.tween_property(
		$LaserImage,
		"scale",
		Vector2(1, 1),
		0.2
	).from(Vector2(0, 0));

func _process(delta):
	var rod = rotation_degrees;
	position.y -= speed * delta;
	
	# Bug but I tried
	if rod:
		position.x += rod * 10 * delta;
