extends Button

# This script defines the behavior of the buttons that appear when
# you select the "Adjust Component" button. Things like the "Countertop" button,
# the "Fridge" button, the "Oven" button, etc.
# If you go to the left into the Scene window and go to MainDesignInfo > Column2 > 
# AdjustComponentOptions, you'll see all of the buttons, and when you select one of them, and
# look on the right at the Inspector panel, you'll see that this script is listed at the top,
# which means that this script is linked to the button. So essentialy, this script is linked to
# each individual button. 

signal change_properties(itemID : int)
# A signal is used to communicate to other scripts.
# A signal has a "sent out" state and a "not sent out"
# state. When a signal is "sent out," it runs all
# functions that are linked to it.
# In this script, you will see how this
# is applied to this "change_properties"
# signal here.

@export var item_id: int = 0
# The "@export" basically makes the variable an editable parameter for each
# object that this script is attached to. So when you select an object that this script is
# attached to and go to the Inspector panel on the right, you'll see the variable as
# an editable parameter.

# This tells the editor where the "properties.gd" script
# is, which is needed because we will be using the things in
# that script in this script.
@onready var properties: Control = $"../Properties"

# This tells the editor where the "main_design_info.gd" script
# is, which is needed because we will be using the things in
# that script in this script.
@onready var main_design_info: Control = $"../../.."

# Called when the node enters the scene tree for the first time.
# In other words, this runs the first frame that the button exists in.
# This is basically where you initialize things. 
func _ready() -> void:
	self.pressed.connect(_button_pressed) # Recall that this script is attached to each button
										  # that appears when you select the "Adjust Component" button.
										  # So this basically says that if the button is pressed,
										  # run the _button_pressed() function that is in this script.
	change_properties.connect(properties.change_shown_properties) # This links the change_shown_properties()
																  # function in the "properties.gd" script to
																  # the change_properties signal that was defined. 
																  # earlier in this script. So when the
																  # change_properties signal is sent out, it will
																  # run the change_shown_properties() function.
	change_properties.connect(main_design_info.change_item) # This links the change_item()
														  	# function in the "main_design_info.gd" script to
															# the change_properties signal. So when the
															# change_properties signal is sent out, it will
															# run the change_item() function.
															


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass # "pass" indicates an empty block of code.
		 # It is used for fucntions that you want to define
		 # but don't want to write code for yet.

# Sends out the "change_properties" signal when this button is pressed.
# The signal will run all the functions that are connected to it, and
# it will send out the "item_id" variable so that other scripts can
# use it.
func _button_pressed():
	change_properties.emit(item_id)
	
