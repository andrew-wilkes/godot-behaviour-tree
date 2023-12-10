@icon("res://icons/always-fail.png")
extends Task

class_name AlwaysFail

func run():
	if get_child_count() > 0:
		get_child(0).run()
	fail()

# Ignore child success
func child_success():
	pass

# Ignore child failure
func child_fail():
	pass
