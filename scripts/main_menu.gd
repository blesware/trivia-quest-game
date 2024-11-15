extends Control

@export var stream_click : AudioStream
@export var stream_hover : AudioStream 

#Metodo del boton PlayButton
func _on_play_button_pressed() -> void:
	AudioManager.play_sound(stream_click)
	
func _on_play_button_mouse_entered() -> void:
	AudioManager.play_sound(stream_hover)

#Metodo del boton ExitButton
func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_exit_button_mouse_entered() -> void:
	AudioManager.play_sound(stream_hover)
