class_name TriviaParser
extends Node

# Método para parsear las trivias desde un JSON
func parse_trivias_from_json(file_path: String) -> Array:
	
	var trivia_list = []  # Array para almacenar las trivias parseadas
	
	# Intenta abrir el archivo en modo lectura. Si la apertura es exitosa, 'file' contendrá una referencia al archivo.
	var file = FileAccess.open(file_path, FileAccess.ModeFlags.READ)  # Apertura segura
	
	if file:  # Si el archivo fue abierto, continúa
		
		var json = JSON.new()  # Crear instancia de la clase JSON
		var json_data = json.parse(file.get_as_text())  # Parsear el contenido del archivo como texto y lo interpreta como un JSON
		
		file.close()  # Cerrar el archivo una vez leído
		
		# Verifica si la operación de parseo fue exitosa.
		if json_data == OK:  # Se compara directamente con OK, ya que json_data es un código de error (int)
			
			# Si el parseo fue exitoso, obtenemos los datos parseados de 'result'.
			var raw_trivia_list = json.get_data()  # Acceder a los datos parseados con json.get_data()
			
			# Itera sobre cada elemento en el Array de datos de trivia.
			for trivia_data in raw_trivia_list:
				
				# Crea un nuevo objeto Trivia con los datos del JSON.
				var trivia = Trivia.new(
					trivia_data["question"],
					trivia_data["options"],
					trivia_data["correctOptionIndex"],
					trivia_data["level"]
				)
				
				trivia_list.append(trivia)  # Agregar la trivia al array
		else:
			print("Error al parsear JSON:", json_data)  # Imprimir el código de error si no fue exitoso
			
	else:
		print("Archivo no encontrado:", file_path)
	
	# Retorna el array de trivias parseadas.
	return trivia_list
