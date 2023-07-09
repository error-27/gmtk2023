extends Control

onready var credits_label = $CreditsPanel/RichTextLabel

func _ready():
	# Generate copyright text
	var copyright_text = ""
	
	copyright_text += "Created by [url=https://github.com/ErrorInCode27][Error_27][/url] and [url=https://github.com/Wired-Weasel]Wired-Weasel[/url] for GMTK Game Jam 2023\n"
	copyright_text += "Made using the [url=https://godotengine.org/license]Godot game engine[/url]\n"
	copyright_text += "Using [url=https://www.dafont.com/superstar-2.font]Superstar font[/url]"
	
	# Components and license names
	var copyright_info = Engine.get_copyright_info()
	copyright_text += "\n\n===THIRD-PARTY COMPONENTS===\n"
	for part in copyright_info:
		copyright_text += part["name"] + " - " + part["parts"][0]["license"] + "\n"
	
	# Actual license text
	copyright_text += "\n===LICENSE TEXTS===\n"
	var licenses = Engine.get_license_info()
	for license in licenses:
		copyright_text += "-----" + license + "-----\n" + licenses[license] + "\n\n"
	
	# Set label to that
	credits_label.bbcode_text = copyright_text
	
	cold_open()
	
	$ColorRect/AnimationPlayer.play("pulse")


func _credits_links(meta):
	OS.shell_open(meta)
	print(meta)


func _on_CloseButton_pressed():
	$CreditsPanel.hide()


func _on_CreditsButton_pressed():
	$CreditsPanel.show()

# Run the cold open sequence to have the funny thing happen
func cold_open():
	randomize()
	$Buttons/CreditsButton.disabled = true
	$Buttons/StartButton.disabled = true
	$Buttons/SettingsButton.disabled = true
	$Buttons/CreditsButton.modulate.a = 0
	$Buttons/StartButton.modulate.a = 0
	$Buttons/SettingsButton.modulate.a = 0
	$FakeButtons.show()
	for button in $FakeButtons.get_children():
		(button as RigidBody2D).set_position(Vector2(rand_range(OS.window_size.x - 40, 132), rand_range(OS.window_size.y - 10, 132)))
		(button as RigidBody2D).rotate(rand_range(0, 6))


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/CharacterSelect.tscn")
