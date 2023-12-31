extends Node2D

export var tiles: int = 6

onready var edit_map = $TileMap

var edit_mode = false

func _ready():
	$CanvasLayer/TileLabel.text = str(tiles) + " tiles"

func _process(delta):
	if edit_mode:
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			var tile = edit_map.world_to_map(edit_map.to_local(get_global_mouse_position()))
			if get_parent().get_node("TileMap").get_cellv(tile) == -1 and edit_map.get_cellv(tile) == -1 and tiles > 0:
				edit_map.set_cellv(tile, 0)
				tiles -= 1
				$CanvasLayer/TileLabel.text = str(tiles) + " tiles"
		elif Input.is_mouse_button_pressed(BUTTON_RIGHT):
			var tile = edit_map.world_to_map(edit_map.to_local(get_global_mouse_position()))
			if edit_map.get_cellv(tile) != -1:
				edit_map.set_cellv(tile, -1)
				tiles += 1
				$CanvasLayer/TileLabel.text = str(tiles) + " tiles"
	
	if Input.is_action_just_pressed("EditMode"):
		edit_mode = not edit_mode
		$CanvasLayer.visible = edit_mode
