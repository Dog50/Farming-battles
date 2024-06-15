extends Node


@onready var player = $"../Player"
@onready var plant = $"../plant"
var enemy_scene =preload("res://enemy.tscn")




@onready var planet = get_node("/root/Planet")



var enemy = preload("res://enemy.tscn")
var spawn_points := []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)



func _on_timer_timeout():
	var spawn = spawn_points[randi() % spawn_points.size()]
	var mushroom = enemy_scene.instantiate()
	mushroom.position = spawn.position
	planet.add_child(mushroom)
	



