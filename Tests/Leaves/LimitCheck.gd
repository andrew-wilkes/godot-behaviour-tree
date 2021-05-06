extends Task

# Respond depending on how many times it is run

class_name LimitCheck

var count = 0

func run():
	count += 1
	# Get out of infinite repeat or detect overflow
	if control.LIMIT > 0 and count > control.LIMIT or control.LIMIT < 1 and count > 10:
		fail()
	else:
		success()

func start():
	count = 0
	.start()

func cancel():
	count = 0
	.cancel()
