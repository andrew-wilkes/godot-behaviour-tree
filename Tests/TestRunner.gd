extends Task

export var num_runs = 4

var list
var idx = 0
var num_failures = 0
var run_count = 0

var TESTS = [
	["Until Fail", SUCCEEDED],
	["Until Success", SUCCEEDED],
	["Always Fail", FAILED],
	["Always Succeed", SUCCEEDED],
	["Invert Succeed", FAILED],
	["Invert Fail", SUCCEEDED],
	["Limit Check Over", FAILED],
	["Limit Check Under", SUCCEEDED],
	["Repeat x 5", SUCCEEDED],
	["Infinite Repeat", FAILED],
	["Parallel Sequence Succeed", SUCCEEDED],
	["Parallel Sequence Fail", FAILED],
	["Parallel Selector Succeed", SUCCEEDED],
	["Parallel Selector Fail", FAILED],
	["Selector Succeed", SUCCEEDED],
	["Selector Fail", FAILED],
	["Random Selector Succeed", SUCCEEDED],
	["Random Selector Fail", FAILED],
	["Sequence Succeed", SUCCEEDED],
	["Sequence Fail", FAILED],
	["Random Sequence Succeed", SUCCEEDED],
	["Random Sequence Fail", FAILED]
]

func _ready():
	list = get_node("/root/Test/Results")
	add_result("TEST", "RESULT")
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

func _process(_delta):
	if status == RUNNING and idx < TESTS.size():
		get_child(idx).run()

func add_result(description, result):
	list.add_item(description)
	list.add_item(result)

func log_result():
	var result = "Pass"
	if status != TESTS[idx][1]:
		num_failures += 1
		result = "Fail"
	add_result(TESTS[idx][0], result)
	# Move to next test
	idx += 1
	if idx < TESTS.size():
		status = RUNNING
	else:
		if num_failures > 0:
			status = FAILED
			result = "FAILED"
		else:
			status = SUCCEEDED
			result = "PASSED"
		add_result("FINISHED", result)
		run_count += 1
		if run_count < num_runs:
			idx = 0
			add_result("RUN", String(run_count + 1))
			start()
			status = RUNNING
		else:
			set_process(false)
