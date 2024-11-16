extends Node2D
#declaramos variables exportables, estas NO se han usado todavia//
@export var life : int
@export var healing : int
#declaramos las variables que manejaran el daño tomando en cuenta el tiempo y la probabilidad
const damage : int = 10
var crit_prob : float = 1
var damage_total : int = 0

# conectamos el nodo timer para que cada 5 segundos reste 20 unidades a la probabilidad de critico
#el nodo timer tiene como configuracion el iniciarse de manera automatica, dicha funcion tendra que modificarse en el futuro para que 
#solo se inicie al comenzar a responder y vuelva a su valor original al terminar de responder
func _on_timer_timeout() -> float:
	crit_prob -= 0.2
	return crit_prob
#esta funcion funciona como debug y para futuro uso al aplicarse una respuesta correcta en el juego, rastrea mediante conecciones
#el accionar de un boton, en este caso llamado ATAQUE, con un label que imprimira si el ataque tiene critico, su total y el valor de la probabilidad
#actual al momento de presionar el boton
func _on_atrack_test_pressed():
	#esta condicional funciona tomando en cuenta la funcion random_chanse creada mas abajo, si el valor devuelto es un booleano
	#positivo, entonces se aplica el critico, de no ser asi, el critico no se toma en cuenta
	if random_chance(crit_prob):
		damage_total = damage * 2
		$Label.text = str(damage_total) + "/ CRITICO / "  + str(crit_prob)
		print("Critico")
		print(crit_prob)
	else:
		damage_total = damage
		$Label.text = str(damage_total) + "/ NO CRITICO / " + str(crit_prob)
		print(damage_total)
		print("No Critico")
		print(crit_prob)
#la funcion random_chance usa el metodo randf() para generar un numero aleatorio del 0.0 al 1 y lo compara con la probabilidad que
#tenemos al momento de precionar el boton de ataque, si el valor de randf() es mayor que la probabilidad de critico, no se aplica
#el critico, de ser menor, el critico si se tomara en cuanta, esto se hace tomando en cuenta que la probabilidad disminuira 0.2 
#cada 5 segundos, haciendo que con el paso del tiempo sea mas dificil que el valor resultado de randf() sea menos al de la probabilidad de
#critico y logrando asi que sea mas dificil conseguir uno hasta el punto de hacerlo imposible una vez pasados 20 segundos
func random_chance(probability : float) -> bool:
	return randf() < probability
