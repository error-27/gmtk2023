extends Control

func _ready():
	$AnimationPlayer.play("error_out")


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/StartScreen.tscn")
