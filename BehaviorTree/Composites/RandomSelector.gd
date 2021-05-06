extends Task

# One randomly selected child must succeed

class_name RandomSelector, "res://icons/random-selector.png"

var sequence
var idx = 0

func set_sequence():
	idx = 0
	sequence = range(get_child_count())
	sequence.shuffle()

func run():
	get_child(sequence[idx]).run()
	running()

func child_success():
	set_sequence()
	success()

func child_fail():
	idx += 1
	if idx >= sequence.size():
		set_sequence()
		fail()

func cancel():
	set_sequence()
	.cancel()

func start():
	set_sequence()
	.start()
