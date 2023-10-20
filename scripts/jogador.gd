extends Node2D

var vidas
var pulos
var velocidade
var velocidade_pulo
var morto

# a quantidade de bolinhas
var bolinhas2


var a =0
#formas que o jogador se transforma	
var scene1 = preload("res://cenas/formas/triangle.tscn")
var scene2 = preload("res://cenas/formas/quadrado.tscn")
var scene3 = preload("res://cenas/formas/pentagon.tscn")
var scene4 = preload("res://cenas/formas/hexagon.tscn")
var scene5 = preload("res://cenas/formas/heptagon.tscn")
var scene6 = preload("res://cenas/formas/circle.tscn")

var som1 = preload("res://cenas/sons/pulo.tscn")


#câmera
var camera1 = preload("res://camera_2d.tscn")

#forma atual
var instance = scene1.instantiate()	

var camera = camera1.instantiate()

var pulo = som1.instantiate()

#bolinhas que o jogador já comeu
var bolinhas:int

#posição do corpo do jogador
var position_x = 0
var position_y=0

#1 é triângulo e 2 é quadrado
var contador =0

func restart():
	
	pulos = 1	
		
	instance.position.x = 300
	instance.position.y =-200
	instance.apply_central_force(Vector2(-200,0) )
	
	position_x = 0
	position_y = 0

#função que troca a forma do jogador
func transformar():
	
	if(bolinhas==3):
		
		bolinhas = 4
		
		velocidade+=400
		velocidade_pulo+=200
		#mantém registrado a posição do jogador
		if is_instance_valid(instance):
			position_x = instance.position.x
			position_y = instance.position.y
		
			instance.queue_free()
						
			instance = scene2.instantiate()	
			add_child(instance)
			instance.position.x = position_x
			instance.position.y=  position_y
								
	if(bolinhas==7):
		bolinhas = 8
		velocidade+=500
		velocidade_pulo+=250
		
		if is_instance_valid(instance):
			
			position_x = instance.position.x
			position_y = instance.position.y
			
			instance.queue_free()
							
			instance = scene3.instantiate()	
			add_child(instance)
			instance.position.x = position_x
			instance.position.y=  position_y
	if(bolinhas==11):
		bolinhas = 12
		velocidade+=500
		velocidade_pulo+=300
		
		if is_instance_valid(instance):
			
			position_x = instance.position.x
			position_y = instance.position.y
			
			instance.queue_free()
							
			instance = scene4.instantiate()	
			add_child(instance)
			instance.position.x = position_x
			instance.position.y=  position_y
	if(bolinhas==15):
		bolinhas = 16
		velocidade+=600
		velocidade_pulo+=350
		
		if is_instance_valid(instance):
			
			position_x = instance.position.x
			position_y = instance.position.y
			
			instance.queue_free()
							
			instance = scene5.instantiate()	
			add_child(instance)
			instance.position.x = position_x
			instance.position.y=  position_y
	if(bolinhas==19):
		bolinhas = 20
		velocidade+=700
		velocidade_pulo+=400
		if is_instance_valid(instance):
			
			position_x = instance.position.x
			position_y = instance.position.y
			
			instance.queue_free()
							
			instance = scene6.instantiate()	
			add_child(instance)
			instance.position.x = position_x
			instance.position.y=  position_y						
		
			
func mover():
	
	if(Input.is_action_pressed("ui_right")):		
	
		instance.apply_central_force(Vector2(velocidade,0) )	
			
	if(Input.is_action_pressed("ui_left")):		
	
		instance.apply_central_force(Vector2(-velocidade,0) )	
			
	if(Input.is_action_just_pressed("ui_up")):		
		
		if(pulos == 1):
			pulo.playing = true
			pulos = 0
			instance.apply_central_impulse(Vector2(0,-velocidade_pulo))
			
							
	
# Called when the node enters the scene tree for the first time.
func _ready():
	
	vidas = 10
	morto = false
	pulos = 1
	velocidade = 1000
	velocidade_pulo=1000
	camera.zoom = Vector2(0.5,0.5)
	bolinhas = 0
	bolinhas2 = 0
	contador = 1	
	
	add_child(pulo)
	add_child(instance)
	position_x = instance.position.x
	position_y = instance.position.y
	
	add_child(camera)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	#bolinhas = bolinhas + 1
	mover()
	transformar()	
	
	position_x = instance.position.x
	position_y = instance.position.y	
	
	#som segue o jogador
	pulo.position = instance.position
	
	#aumenta a gravidade
	instance.apply_central_force(Vector2(0,2000))
	
	
	camera.offset = Vector2(position_x,position_y)	
	
	#se reiniciar ou morrer
	if(Input.is_action_just_pressed("e") || instance.position.y >4000 || vidas == 0):
		morto = true
		
