class_name Escudo
extends Area2D

## Variables
var esta_activado:bool = false setget, get_esta_activado

## Metodos
func _ready() -> void:
	controlar_colisionador(true)
	
## Metodos Custom
func controlar_colisionador(esta_desactivado:bool) -> void:
	$CollisionShape2D.set_deferred("disabled", esta_desactivado)
	
func activar() -> void:
	esta_activado = true
	controlar_colisionador(false)
	$AnimationPlayer.play("activandose")
	
	
## Señales internas

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "activandose":
		$AnimationPlayer.play("activado")
		
## Setters y Getters
func get_esta_activado() -> bool:
	return esta_activado
