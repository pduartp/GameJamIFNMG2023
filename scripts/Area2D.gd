extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#permite ao jogador pular quando está no chão
func _on_body_entered(body):
	if(body.name == "quadrado" || body.name == "triangle" || body.name == "pentagon" || body.name == "hexagon" || body.name == "heptagon" || body.name == "circle"):
		
		body.get_parent().pulos = 1


#func _on_body_exited(body):
	#if(body.name == "quadrado" || body.name == "triangle"):		
		#body.get_parent().pulos =0
