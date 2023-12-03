# Script for the player buttons to access the home page, inventory, and instructions
extends Node2D

# Instance of the instructions page scene. Toggle visibility when user presses the "Inventory" button
@onready var instructionsPage = get_node("Instructions page")

func _ready():
	# Display/render the buttons above other elements in the environment
	for i in range(get_child_count()):
		var child_node = get_child(i)
		child_node.z_index = 1
	
	# Disable visibility on the instructions page
	instructionsPage.visible = false

# Change the scene to the menu navigation page when the "Home" button is pressed
func _on_home_button_down():
	get_tree().change_scene_to_file("res://Level Navigation/level_select.tscn")

# Change the scene to the inventory page when the "Inventory" button pressed
func _on_inventory_button_down():
	get_tree().change_scene_to_file("res://Inventory/Inventory.tscn")

# Button to open the instructions page. Turn on visibility on the instantiation node for the instruction scene
func _on_instructions_button_down():
	instructionsPage.visible = true
