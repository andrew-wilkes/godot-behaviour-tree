extends Task

# Simulate a sequence of responses

class_name StatusSequence

# List of successive status values
var sequence = [SUCCEEDED, FAILED]

var idx = 0

func run():
	match status:
		SUCCEEDED:
			success()
		FAILED:
			fail()
		_:
			running()
	# Change to next status value
	if idx < sequence.size():
		status = sequence[idx]
		idx += 1

func start():
	idx = 0
	.start()

func cancel():
	idx = 0
	.cancel()
