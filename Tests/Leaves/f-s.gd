extends StatusSequence

# Sequence of Fail > Success responses

class_name FtoS

func _ready():
	sequence = [FAILED, SUCCEEDED]
