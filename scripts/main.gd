extends Node2D

@onready var anim = $Coin/AnimatedSprite2D

var total_flips = 0
var target_flips = 0
var current_flips = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toss"):
		target_flips  = randi_range(4, 5)
		current_flips = 0
		anim.play("default")

var last_frame = -1

func _process(delta):
	if anim.is_playing() && anim.frame != last_frame:
		last_frame = anim.frame
		if (anim.frame == 0 && total_flips != 0) || anim.frame == 12:			
			current_flips += 1
			total_flips += 1
			
			if current_flips == target_flips:
				anim.pause()
				print("Coin Result:", "Heads" if total_flips % 2 == 0 else "Tails")
