extends Button

signal change_properties(itemID : int)

@export var item_id: int = 0

@onready var properties: Control = $"../Properties"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_button_pressed)
	change_properties.connect(properties.change_shown_properties)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _button_pressed():
	change_properties.emit(item_id)
	
