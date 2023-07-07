extends Control

onready var credits_label = $CreditsPanel/RichTextLabel

func _ready():
	# Generate copyright text
	var copyright_text = ""
	
	copyright_text += "Created by [url=https://github.com/ErrorInCode27][Error_27][/url] and [url=https://github.com/Wired-Weasel]Wired-Weasel[/url] for GMTK Game Jam 2023\n"
	copyright_text += "Made using the [url=https://godotengine.org/license]Godot game engine[/url]\n"
	
	# Components and license names
	var copyright_info = Engine.get_copyright_info()
	copyright_text += "\nTHIRD-PARTY COMPONENTS\n"
	for part in copyright_info:
		copyright_text += part["name"] + " - " + part["parts"][0]["license"] + "\n"
	
	# Actual license text
	copyright_text += "\nLICENSE TEXTS\n"
	var licenses = Engine.get_license_info()
	for license in licenses:
		copyright_text += "-----" + license + "-----\n" + licenses[license] + "\n\n"
	
	# Set label to that
	credits_label.bbcode_text = copyright_text


func _credits_links(meta):
	OS.shell_open(meta)
	print(meta)


func _on_CloseButton_pressed():
	$CreditsPanel.hide()


func _on_CreditsButton_pressed():
	$CreditsPanel.show()
