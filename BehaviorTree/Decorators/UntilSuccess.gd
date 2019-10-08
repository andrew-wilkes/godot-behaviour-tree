extends Task

class_name UntilSuccess, "res://icons/until-success.png"

func run():
	running()

func _process(delta):
	if status == RUNNING:
		get_child(0).run()
	return delta

func child_success():
	success()
