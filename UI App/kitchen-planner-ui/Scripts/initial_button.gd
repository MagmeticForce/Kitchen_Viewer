extends Button

signal change_function(initialID : int)

@export var initial_id: int = 0


@onready var column_1: Control = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_button_pressed)
	change_function.connect(column_1.change_shown_function)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _button_pressed():
	
	change_function.emit(initial_id)
	
