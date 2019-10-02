extends Task

class_name Counter

var count = 0

const MAX = 100

func run():
	running()

func _process(delta):
	if status == RUNNING:
		count += 1
		if count <= MAX:
			tree.show_value("Count", count)
		else:
			count = 0
			success()
	return delta
