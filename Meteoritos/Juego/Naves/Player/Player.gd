class_name Player
extends RigidBody2D

#Atributos export
export var potencia_motor:int = 20
export var potencia_rotacion:int = 280
export var trai_maxima:int = 150

#Atributos
var empuje:Vector2 = Vector2.ZERO
var dir_rotacion:int = 280

##Atributos Onready
onready var canion:Canion = $Canion
onready var laser:RayoLaser = $Canion/LaserBeam2D
onready var trail:Trail2D = $PuntoTrail/Trail2D
onready var motor_sfx:Motor = $MotorSFX

#Metodos
func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("disparo_secundario"):
		laser.set_is_casting(true)		
	if event.is_action_released("disparo_secundario"):
		laser.set_is_casting(false)
		
	# Control trail y sonido motor
	if event.is_action_pressed("mover_adelante"):
		trail.set_max_points(trai_maxima)
		motor_sfx.sonido_on()
	elif event.is_action_pressed("mover_atras"):		
		trail.set_max_points(0)
		motor_sfx.sonido_on()
	
	if(event.is_action_released("mover_adelante")
		 or event.is_action_released("mover_atras")):
				motor_sfx.sonido_off()


func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	apply_central_impulse(empuje.rotated(rotation))
	apply_torque_impulse(dir_rotacion * potencia_rotacion)

func _process(delta: float) -> void:
	player_input()
	
#Metodos Custom
func player_input() -> void:
	#Empuje
	empuje = Vector2.ZERO
	if Input.is_action_pressed("mover_adelante"):
		empuje = Vector2(potencia_motor, 0)
	elif Input.is_action_pressed("mover_atras"):
		empuje = Vector2(-potencia_motor, 0)
		
	#Rotacion
	dir_rotacion = 0
	if Input.is_action_pressed("rotar_antihorario"):
		dir_rotacion -= 1
	if Input.is_action_pressed("rotar_horario"):
		dir_rotacion += 1
		
	#Disparo
	if Input.is_action_pressed("disparo_principal"):
		canion.set_esta_disparando(true)
		
	if Input.is_action_just_released("disparo_principal"):
		canion.set_esta_disparando(false)
	
	
