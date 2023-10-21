class_name MeteoritoSpawner
extends Position2D

## Atributos export
export var direccion:Vector2 = Vector2(1,1)
export var rango_tamano_meteorito:Vector2 = Vector2(0.5, 2.2)

func _ready() -> void:
	yield(owner, "ready")
	spawner_meteorito()
	
func spawner_meteorito() -> void:
	Eventos.emit_signal(
		"spawn_meteorito",
		 global_position,
		 direccion,
		 tamanio_meteorito_aleatorio()
		)

func tamanio_meteorito_aleatorio() -> float:
	randomize()
	return rand_range(rango_tamano_meteorito[0], rango_tamano_meteorito[1])
