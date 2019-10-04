extends Task

var list
var idx = 0

var TESTS = [
	["Until Fail", SUCCEEDED]
]

func _ready():
	list = get_node("/root/Test/Results")
	add_result("Test", "Result")
	tree = self
	start()
	status = RUNNING

func child_running():
	status = RUNNING

func child_success():
	status = SUCCEEDED
	log_result()

func child_fail():
	status = FAILED
	log_result()

func _process(delta):
	if status == RUNNING:
		get_child(idx).run()
	return delta

func add_result(description, result):
	list.add_item(description)
	list.add_item(result)

func log_result():
	var result = "Pass" if status == TESTS[idx][1] else "Fail"
	add_result(TESTS[idx][0], result)
	# Move to next test
	idx += 1
	if idx < TESTS.size():
		status = RUNNING
	else:
		add_result("FINISHED", "")
