@icon("res://icons/until-fail.png")
extends Task

# Only reports a failure

class_name UntilFail

func run():
	get_child(0).run()
	running()

# Ignore child success
func child_success():
	pass

func child_fail():
	success()
