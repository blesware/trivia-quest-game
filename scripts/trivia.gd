class_name Trivia #Nombre de la clase
extends RefCounted #Herencia de la clase RefCounted

#Atributos de la clase Trivia
var question: String
var options: Array
var correct_option_index: int
var level: int

#Constructor
func _init(p_question: String = "", p_options: Array = [], p_correct_option_index: int = 0, p_level: int = 1):
	self.question = p_question
	self.options = p_options
	self.correct_option_index = p_correct_option_index
	self.level = p_level

#Metodo para devolver si la opcion de la trivia dada es la correcta
func is_correct_answer(option_index: int) -> bool:
	return option_index == correct_option_index
