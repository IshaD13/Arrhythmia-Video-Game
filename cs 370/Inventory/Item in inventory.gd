# There is anassumption that each animation in ItemAnimation node
# will have names the exact (case-sensitive) to the names of items in inventory
extends Node2D

@onready var anim = $ItemAnimation
@onready var inventory = get_node("/root/Inventory")

@onready var grid = get_parent().get_parent()

func _ready():
	anim.hide()


func _on_item_current(item_id):
	if item_id == "Key":
		anim.set_animation(item_id)
		anim.set_frame(0)
		anim.show()
	elif item_id == "Frog":
		anim.set_animation(item_id)
		anim.set_frame(0)
		anim.show()

func _on_item_anim_play(item_id):
	anim.show()
	anim.play(item_id)
	
func _on_item_anim_stop(item_id):
	anim.pause()
	anim.set_frame(0)
