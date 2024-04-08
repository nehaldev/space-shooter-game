extends Control

@export var level_scene: PackedScene

func _ready():
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score);
	$GameOverMusic.play();

func _input(_event):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://scenes/level.tscn");
