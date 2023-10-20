extends Node2D

var contador
var jogador = preload("res://cenas/jogador.tscn")


var music = preload("res://cenas/sons/music.tscn")
var pontos = preload("res://cenas/canvas_layer.tscn")

var instance = jogador.instantiate()	
var instance2 = music.instantiate()
var instance3 = pontos.instantiate()

#pontos
var texto




# Called when the node enters the scene tree for the first time.
func _ready():
	
	contador = 0
	add_child(instance)
	add_child(instance2)
	add_child(instance3)
	
	
	
	texto = instance3.get_child(0)	
	texto.text = "pontos: " + str( instance.bolinhas2) + "/21" + "      Pegue todas as frutinhas!"
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	contador+=1
	if( instance2.playing == false):
		instance2.queue_free()
		instance2 = music.instantiate()
		add_child(instance2)
	
	if(instance.morto):
		get_tree().reload_current_scene()	
		
	if(contador >= 100):
		texto.text ="pontos: " + str( instance.bolinhas2) + "/21"
		
	pass
