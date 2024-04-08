extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn");
var laser_scene: PackedScene = load("res://scenes/laser.tscn");

var health:= 3;

func _ready():
	get_tree().call_group("ui", "set_health", health);
	
	var size:= get_viewport().get_visible_rect().size;
	var rng:= RandomNumberGenerator.new();
	
	for star in $Stars.get_children():
		var random_x = rng.randi_range(0, int(size.x));
		var random_y = rng.randi_range(0, int(size.y));
		star.position = Vector2(random_x, random_y);
		
		var random_scale = rng.randf_range(1, 2);
		star.scale = Vector2(random_scale, random_scale)
		
		star.speed_scale = rng.randf_range(0.6, 1.4);

func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate();
	
	$Meteors.add_child(meteor);
	
	meteor.connect("collision", _on_meteor_collision);
	meteor.connect("playDestroySound", _on_meteor_destroy);

func _on_meteor_destroy():
	$MeteorDestroySound.play();

func _on_meteor_collision():
	health -= 1;
	get_tree().call_group("ui", "set_health", health);
	$Player.play_collision_sound();
	
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn");
		#get_tree().change_scene_to_packed(
			#load("res://scenes/game_over.tscn")
		#);

func _on_player_laser(pos, rod):
	var laser = laser_scene.instantiate();
	#laser.position = pos - laserPos;
	laser.position = pos;
	laser.rotation_degrees = rod;
	$Lasers.add_child(laser);
