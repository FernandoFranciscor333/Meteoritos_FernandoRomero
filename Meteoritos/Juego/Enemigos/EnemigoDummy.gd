extends Node2D

##Atributos
var hitpoints:float=10

func _process(_delta: float) -> void:
	$Canion.set_esta_disparando(true)

func _on_body_entered(body: Node) -> void:
	if body is Player:
		body.destruir()
	
##Metodos custom	
func recibir_danio(danio) -> void:
	hitpoints -= danio
	print(hitpoints)
	if hitpoints <= 0.0:
		queue_free()
	


	
	
