extends CharacterBody2D
@onready var player = $"../Player"
@onready var E_sprite = $AnimatedSprite2D
@onready var animated_sprite = $AnimatedSprite2D










var player_chase = false
var speed = 50
var HP = 50

var dead = false


func _physics_process(delta):
	
	if HP < 1:
		dead = true
		
		
	if dead:
		queue_free()
	
	
	_take_damage()
	
	if dead == false:
		E_sprite.animation = "default"
		
	if dead:
		E_sprite.animation = "death"
	
	if HP < 1:
		E_sprite.animation = "death"
		dead = true
		
	if player_chase:
		position += (player.position - position)/speed
	
	
	


func _on_sight_body_entered(body):
	if player == body:
		player_chase = true
	

func _hurt():
	HP = HP - 10



func _on_sight_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.


func _on_sight_body_exited(body):
	player_chase = false

	
func _take_damage():
	if Global_E.player_attacking == true:
		HP = HP - 100
		
	
