extends Button

# This script defines the behavior of the buttons that you see
# when you first open the application. These are the "Input Dimensions"
# button, the "Style Filters" button, the "Adjust Component" button, etc.
# If you look to the left at the "Scene" window, navigate to MainDesignInfo > Column1, 
# select one of the buttons, and look at the Inspector panel on the right, you'll see
# this script is linked to each of those buttons.

signal change_function(initialID : int)
# signals are explained in the component_pick_button.gd script.

@export var initial_id: int = 0
# @ export variables are explained in the component_pick_button.gd script.

@onready var column_1: Control = $".."

# Called when the node enters the scene tree for the first time.
# In other words, this runs the first frame that the button exists in.
# This is basically where you initialize things. 
func _ready() -> void:
	
	# This is signal-related code, which is explained in component_pick_button.gd
	self.pressed.connect(_button_pressed)
	change_function.connect(column_1.change_shown_function) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass # "pass" indicates an empty block of code.
		 # It is used for fucntions that you want to define
		 # but don't want to write code for yet.

func _button_pressed():
	
	# Sends out the "change_function" signal when this button is pressed.
	# The signal will run all the functions that are connected to it, and
	# it will send out the "initial_id" variable so that other scripts can
	# use it.
	change_function.emit(initial_id)
	
