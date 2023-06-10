extends Node2D

var SPEED = 50

func _physics_process(delta):
	position.y -= SPEED * delta
