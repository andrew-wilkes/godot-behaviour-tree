@icon("res://icons/limit.png")
extends Task

# Will fail if the child task succeeds and gets called again too many times

class_name Limit

# Maximum number of times to run
@export var LIMIT: int = 4

var count = 0

func run():
	get_child(0).run()
	running()

func child_success():
	count += 1
	if count >= LIMIT:
		count = 0
		fail()
	else:
		success()

func child_fail():
	count = 0
	fail()

func start():
	count = 0
	super.start()

func cancel():
	count = 0
	super.cancel()
