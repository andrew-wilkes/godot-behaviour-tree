extends Task

# Call child node num_calls times on success

class_name Call

export var num_calls = 2

var count = 0
var repeating = false

func run():
	if not repeating:
		repeating = true
		get_child(0).run()
	running()

func child_success():
	count += 1
	if count >= num_calls:
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
	.start()

func cancel():
	count = 0
	repeating = false
	.cancel()
