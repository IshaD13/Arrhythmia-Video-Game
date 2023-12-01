extends Node2D

@onready var timmy = $AudioStreamPlayer2D
@onready var deathTimer = $deathTimer
@onready var state = $boss/FiniteStateMachine/Shoot
@onready var global_hit = get_node("/root/Global")
var lanesize = 105

@onready var newPos1 = $boss.position
@onready var newPos2 = Vector2(lanesize, 0) + $boss.position
@onready var newPos3 = Vector2(lanesize*2, 0) + $boss.position

@onready var poses = [newPos1, newPos2, newPos3]
@onready var lasttime = 0.0
@onready var prev = 7
@onready var prevprev = 6

# Boolean flag for battle won, true when boss beaten byt the player and false otherwise
var bossBeaten = false
# Signal to unlock the door to exit the boss battle room and return to the level when boss battle is beaten
#signal lockDisabled(lockIdx)
# Get inventory
@onready var inventory = get_node("/root/Inventory")


# Called when the node enters the scene tree for the first time.
func _ready():
	global_hit.restart_hits()
	


	
# when music is up, change scene (temp: main menu)
func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Level 1/bossbattle_floor5.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$AudioStreamPlayer2D.get_time()
	var t = timmy.time
	print(t) 
	
	if(global_hit.hits == 1):
		$HealthBar.play("2")
	elif(global_hit.hits == 2):
		$HealthBar.play("1")
	elif(global_hit.hits == 3):
		$HealthBar.play("0")
		state.exit()
		if(deathTimer.is_stopped()):
			deathTimer.start()
		#get_tree().change_scene_to_file("res://Level 1/floor5.tscn")	
	if(global_hit.hits < 3):
		if(t - lasttime >= 0.375):
			var randInd = randi_range(0, 2)
			if(prevprev == randInd && prev == randInd):
				randInd = randi_range(0, 2)
			prevprev = prev
			prev = randInd

			var randomElement = poses[randInd]

			$boss.set_position(randomElement)
			lasttime = t


func _on_death_timer_timeout():
	#print("Timer stop")
	get_tree().change_scene_to_file("res://DeathScene2.tscn")