extends Popup


#onready var pause_enabled = (false)

func _ready():
	pass
	#var pause_enable = false
	#if Input.action_press("Pause"):
	
	#	pause_enable = true
	#while pause_enable == true:
	#	if Input.action_press("Pause"):
	#		visible = false
	#		pause_enable = false
	#	else:
	#		pass


onready var fullscreen_setting = $"Settings tabs/General/MarginContainer/GridContainer/Fullscreen/fullcheck"
onready var Vsync_setting = $"Settings tabs/Graphics/MarginContainer/GridContainer/vscheck"
onready var maxfps_setting = $"Settings tabs/Graphics/MarginContainer/GridContainer/maxfps button"
onready var displayfps_setting = $"Settings tabs/Graphics/MarginContainer/GridContainer/FPS button"



func _on_fullcheck_toggled(button_pressed):
	pass # Replace with function body.


func _on_vscheck_toggled(button_pressed):
	pass # Replace with function body.


func _on_potatoslider_value_changed(value):
	pass # Replace with function body.


func _on_maxfps_button_item_selected(index):
	pass # Replace with function body.


func _on_FPS_button_toggled(button_pressed):
	pass # Replace with function body.
