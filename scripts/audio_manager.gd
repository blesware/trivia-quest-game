extends Node

# este script, que adopta por extencion las propiedades de un Nodo (Node) reproduce de manera inmediata los sonidos asignados con anterioridad
# a los botones del menu de titulo
func play_sound(stream : AudioStream):
	var instance = AudioStreamPlayer.new()
	instance.stream = stream
	instance.finished.connect(remove_node.bind(instance))
	#se asigna un bus de audio, en este caso es UI
	instance.bus = &"UI"
	add_child(instance)
	instance.play()
# remueve el registro del sonido, esto evita que se acumulen entradas y que ocupen espacio de memoria
func remove_node(instance: AudioStreamPlayer):
	instance.queue_free()
