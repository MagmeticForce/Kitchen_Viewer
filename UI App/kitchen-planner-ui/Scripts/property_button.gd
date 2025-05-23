extends Button

signal change_property(propertyID : int)

@export var property_id: int = 0

@onready var design_info : Node = Engine.get_main_loop().root.get_node("MainDesignInfo")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_button_pressed)
	change_property.connect(design_info.change_property)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _button_pressed():
	change_property.emit(property_id)
	
