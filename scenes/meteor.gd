extends Area2D

var speed: int;
var rotation_speed: int;
var direction_x: float;

signal collision;
signal playDestroySound;

func _ready():
	var rng:= RandomNumberGenerator.new();
	
	var path: String = "res://assets/PNG/Meteors/meteorBrown_big" + str(rng.randi_range(1, 4)) + ".png"
	$MeteorImage.texture = load(path);
	
	var width = get_viewport().get_visible_rect().size.x;
	#var height = get_viewport().get_visible_rect().size.y;
	
	var random_x = rng.randi_range(0, width);
	var random_y = rng.randi_range(-150, -50);
	position = Vector2(random_x, random_y);
	
	speed = rng.randi_range(200, 500);
	direction_x = rng.randf_range(-1, 1);
	rotation_speed = rng.randi_range(40, 100);

func _process(delta):
	#rotation += 0.2 * 5 * delta;
	rotation_degrees += rotation_speed * delta;
	
	#position.x += rng.randi_range(-50, 150) * delta;
	position += Vector2(direction_x, 1.0) * speed * delta;

func _on_body_entered(_body):
	#print("Body entered");
	#print(body)
	collision.emit();


func _on_area_entered(area):
	area.queue_free();
	queue_free();
	emit_signal("playDestroySound");
