extends Task

var GUI

func _ready():
	GUI = get_node("/root/Test/GUI")
	tree = self
	start()
	status = RUNNING
	show_value("Status", "RUNNING")

func child_running():
	status = RUNNING

func child_success():
	status = SUCCEEDED
	show_value("Status", "SUCCEEDED")

func child_fail():
	status = FAILED
	show_value("Status", "FAILED")

func _process(delta):
	if status == RUNNING:
		get_child(0).run()
	return delta

func show_value(label, txt):
	GUI.find_node(label).text = "%s" % txt
