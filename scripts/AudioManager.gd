extends Node

func play_sound(stream : AudioStream):
	var instance = AudioStreamPlayer.new()
	instance.stream = stream
	instance.finished.connect(remove_node.bind(instance))
	instance.bus = &"UI"
	add_child(instance)
	instance.play()

func remove_node(instance: AudioStreamPlayer):
	instance.queue_free()
