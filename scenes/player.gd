extends CharacterBody2D

signal laser(pos: Vector2, rod);
@export var speed: int = 500;

var weaponCooldown = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	var pos_x_half = float(1280) / 2;
	var pos_y_half = float(720) / 2;
	position = Vector2(pos_x_half, pos_y_half);
	$WeaponCooldown.connect("timeout", weaponCooldownTimeout);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down");
	#print(direction)
	#position += direction * speed * delta;
	velocity = direction * speed # Don't need delta as it godot does here automatically
	move_and_slide()
	
	if Input.is_action_just_pressed("fire"):
		#laser.emit(position, $LaserStartPosition.position)
		if weaponCooldown != true:
			laser.emit($LaserStartPosition.global_position, global_rotation_degrees);
			
			weaponCooldown = true
			$WeaponCooldown.start();
			$LaserSound.play();
	
	if Input.is_action_pressed("rotate_left"):
		rotation -= 0.2 * 20 * delta;
	
	if Input.is_action_pressed("rotate_right"):
		rotation += 0.2 * 20 * delta;
	#if Input.is_action_just_pressed("ui_down"):
		#
		#position += Vector2(1, 0) * 150 * delta;
		#$PlayerImage.rotation += 6.5 * delta
		
func play_collision_sound():
	#print("Sound")
	$DamageSound.play();
		
func weaponCooldownTimeout():
	weaponCooldown = false;
