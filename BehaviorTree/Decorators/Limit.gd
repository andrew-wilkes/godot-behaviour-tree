extends Task

class_name Limit, "res://icons/limit.png"

# Maximum number of times to run
export(int) var LIMIT = 100

var count = 0

func run():
	if count < LIMIT:
		count += 1
		get_child(0).run()
		running()
	else:
		success()

func reset():
	cancel()
	status = FRESH
	count = 0
