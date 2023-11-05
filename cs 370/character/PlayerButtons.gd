# Script for the player buttons to access the home page and inventory 
extends Node2D

var child_node: Button

@onready var inventory =  get_node("/root/Inventory")

func _ready():
	
	var path = inventory.get_current_level()
	
	# Display/render the buttons above other elements in the environment
	for i in range(get_child_count()):
		child_node = get_child(i)
		child_node.z_index = 2

func _on_home_button_down():
	get_tree().change_scene_to_file("res://first_game.tscn")


func _on_inventory_button_down():
	get_tree().change_scene_to_file("res://Inventory/Inventory.tscn")