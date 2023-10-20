extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body.name == "quadrado" || body.name == "triangle" || body.name == "pentagon" || body.name == "hexagon" || body.name == "heptagon" || body.name == "circle"):
		
		body.get_parent().morto = true
	pass # Replace with function body.
