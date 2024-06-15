extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D
@onready var slash_timer = $slash_timer
@onready var enemy = $"../Enemy"
@onready var attack_T = $attack_timer



const speed = 250

var attacking = false
#extends CharacterBody2D

#TL is used to check if the enemy is in the attack_area
var TL = false
var run = "run"
var default = "default"
var attack = "slash-right1"
var hp = 100

var sprite_an = false
# Get the gravity from the project settings to be synced with RigidBody nodes.

#check if the enemy is in the area 2D
var enemy_inzone = false




	
func _P_and_enemy():
	if attacking and enemy_inzone == true:
		Global_E.player_attacking = true
		


func _physics_process(delta):
	
	
	
	_P_and_enemy()
	
	if velocity.x == -1:
		sprite.flip_h
	
	
	if 1 > 0:
		sprite.flip_h
	
	if (velocity.x > 1 || velocity.x < -1 || velocity.y < -1 || velocity.y > 1):
		sprite.animation = run
	
	else:
		sprite.animation = default
		
		
	var last_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
		)

		
	var directionP = last_direction
	
	velocity = last_direction * speed
	
	if sprite_an:
		$slash_timer.start
		attacking = false
		
	
		
	
	
	
	var HD1 = Input.get_axis("left", "right")
	
	if Input.get_action_strength("attack"):
		run = "attack"
		default = "attack"
		attack_T.start()
		sprite_an = true
		attacking = true
	
	
	if HD1 != 0:
		sprite.flip_h = (HD1 == -1)
		
	if TL:
		print("paper")
		
	


	move_and_slide()
	
	


func _on_timer_timeout():
	pass # Replace with function body.







func _on_attack_area_body_entered(body):
	enemy = body
	if body.is_in_group("enemy"):
		print("entered attack range")
		enemy_inzone = true
		print("inside area")
	


func _on_attack_area_body_exited(body):
	enemy_inzone = false
	print("left")
	



func _on_attack_timer_timeout():
	default = "default"
	run = "run"
	print("Timer ended")
