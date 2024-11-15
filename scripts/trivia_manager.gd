class_name TriviaManager
extends Node

#Ruta del JSON
@export var trivia_file_path: String = "res://scripts/json/trivias.json"

var trivia_list = []
var current_trivia_index = 0

func parse():
	
	# Cargar las trivias usando TriviaParser
	var trivia_parser = TriviaParser.new()
	trivia_list = trivia_parser.parse_trivias_from_json(trivia_file_path)
	
	if trivia_list.size() > 0:
		
		# Mostrar todas las trivias en consola
		for i in range(trivia_list.size()):
			show_trivia(i)
	else:
		print("No se encontraron trivias.")

#WARNING Metodo para mostrar la trivia POR AHORA EXPERIMENTAL
func show_trivia(index: int):
	
	if index < 0 or index >= trivia_list.size():
		
		print("Índice de trivia fuera de rango.")
		return
	
	var trivia = trivia_list[index]
	
	# ALERT Formato solicitado para mostrar en consola TEMPORAL
	print("Pregunta: ", trivia.question)
	print("[", trivia.options[0], "] [", trivia.options[1], "]")
	print("[", trivia.options[2], "] [", trivia.options[3], "]")
	print("")
