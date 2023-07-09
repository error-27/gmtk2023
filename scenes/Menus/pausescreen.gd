extends Panel


#onready var pause_enabled = (false)

func _ready():
	pass


onready var fullscreen_setting = $"Settings tabs/General/MarginContainer/GridContainer/Fullscreen/fullcheck"
onready var Vsync_setting = $"Settings tabs/Graphics/MarginContainer/GridContainer/vscheck"
onready var maxfps_setting = $"Settings tabs/Graphics/MarginContainer/GridContainer/maxfps button"
onready var displayfps_setting = $"Settings tabs/Graphics/MarginContainer/GridContainer/FPS button"



func _on_fullcheck_toggled(button_pressed):
	pass



func _on_vscheck_toggled(button_pressed):  # set up global settings script so this can persist
	pass



func _on_potatoslider_value_changed(value):
	pass # This is intentional, It's Pixel art


func _on_maxfps_button_item_selected(index):
	pass # Replace with function body.


func _on_FPS_button_toggled(button_pressed):
	pass
