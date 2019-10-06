extends Task

# Keep running the child until it gives a result

class_name RepeatChild

func run():
	get_child(0).run()
	running()
