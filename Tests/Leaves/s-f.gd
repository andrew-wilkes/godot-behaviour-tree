extends StatusSequence

# Sequence of Success > Fail responses

class_name StoF

func _ready():
	sequence = [SUCCEEDED, FAILED]
