extends Node2D



func _on_body_entered(body: Node) -> void:
	if body is Player:
		body.destruir()
