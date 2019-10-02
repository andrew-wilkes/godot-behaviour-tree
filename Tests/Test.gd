extends Node2D

func _ready():
	$BT.GUI = $GUI
	$BT.start()

func _process(delta):
	