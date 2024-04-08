extends CanvasLayer

static var image = load("res://assets/PNG/UI/playerLife2_red.png");
var time_elapsed := 0

func set_health(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free();
	
	for i in amount:
		var rect = TextureRect.new();
		rect.texture = image;
		rect.stretch_mode = 2;
		$MarginContainer2/HBoxContainer.add_child(rect);


func _on_score_timer_timeout():
	time_elapsed += 1
	$MarginContainer/Label.text = str(time_elapsed);
	Global.score = int(time_elapsed);
