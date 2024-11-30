extends CharacterBody3D

var moveSpeed: float = 10.0
var jumpForce: float = 10.0
var gravity: float = 25.0

var gold : int = 16

@onready var camera = $Pivote
@onready var ui = $CanvasLayer/UI

func _ready() -> void:
	ui.update_trash_text(gold)

func _physics_process(delta: float) -> void:
	# Inicializa la velocidad en los ejes X y Z
	velocity.x = 0
	velocity.z = 0
	
	var input = Vector3()
	
	# Detecta la entrada de movimiento en los ejes X y Z
	if Input.is_action_pressed("ui_up"):
		input.z += 1
	if Input.is_action_pressed("ui_down"):
		input.z -= 1
	if Input.is_action_pressed("ui_left"):
		input.x += 1
	if Input.is_action_pressed("ui_right"):
		input.x -= 1
		
	input = input.normalized()
	
	# Calcula la dirección del movimiento
	var dir = (transform.basis.z * input.z + transform.basis.x * input.x)
	
	# Asigna la velocidad de movimiento en los ejes X y Z
	velocity.x = dir.x * moveSpeed
	velocity.z = dir.z * moveSpeed
	
	# Aplica la gravedad en el eje Y
	velocity.y -= gravity * delta
	
	# Salta si el personaje está en el suelo
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = jumpForce
	
	# Mueve el personaje con la nueva función `move_and_slide` sin parámetros
	move_and_slide()

func give_gold(goldToGive):
	gold += goldToGive
	ui.update_trash_text(gold)
	if gold >= 17:
		get_tree().change_scene_to_file("res://creditos.tscn") 
	
