extends Task

class_name Repeat

# Number of times to run or zero for infinite
export(int) var LIMIT = 100

var count = 0
var repeating = false

func run():
	repeating = true
	running()

func _process(delta):
	if repeating:
		get_child(0).run()

func child_success():
	if LIMIT > 0:
		count += 1
		if count >= LIMIT:
			count = 0
			repeating = false
			success()
