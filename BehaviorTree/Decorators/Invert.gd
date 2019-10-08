extends Task

class_name Invert, "res://icons/invert.png"

func run():
	get_child(0).run()
	running()

func child_success():
	fail()

func child_fail():
	success()
