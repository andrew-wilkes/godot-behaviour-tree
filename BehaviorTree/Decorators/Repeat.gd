@icon("res://icons/repeat.png")
extends Task

# Repeats the child Task and reports Success after repeating unless it fails

class_name Repeat

# Number of times to run or zero for infinite
@export var LIMIT: int = 5

var count = 0
var repeating = false

func run():
	if not repeating:
		repeating = true
		get_child(0).run()
	running()

func child_success():
	if LIMIT > 0:
		count += 1
		if count >= LIMIT:
			count = 0
			repeating = false
			success()
	if repeating:
		get_child(0).run()

func child_fail():
	repeating = false
	fail()

func start():
	count = 0
	repeating = false
	super.start()

func cancel():
	count = 0
	repeating = false
	super.cancel()
