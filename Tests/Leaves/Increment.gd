extends Task

class_name Increment

var count = 0

func run():
	count += 1
	tree.show_value("Count", count)
	success()
