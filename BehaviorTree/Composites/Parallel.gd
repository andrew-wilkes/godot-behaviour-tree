extends Task

class_name Parallel

enum { SEQUENCE, SELECTOR }

export(bool) var policy = SEQUENCE

var num_results = 0

func run():
	for child in get_children():
		child.run()
	running()

func child_success():
	num_results += 1
	if policy == SEQUENCE:
		if num_results >= get_child_count():
			num_results = 0
			success()
	else:
		success()

func child_fail():
	num_results += 1
	if policy == SELECTOR:
		if num_results >= get_child_count():
			num_results = 0
			fail()
	else:
		fail()
