extends Button

# This script defines the behavior of the buttons that appear when
# you select the "Adjust Component" button, and then select one of the kitchen
# components, like a countertop or fridge or microwave or whatever. These are
# the buttons like the "White", "Silver," and "Black" buttons, or the "WhiteMarble", 
#"Soapstone", or "Wood Tile" buttons, depending on which kitchen component you selected.
# If you go to the left into the Scene window and go to  MainDesignInfo > Column2 > 
# AdjustComponentOptions > Properties, you'll see all of these buttons, and when you 
# select one of them, and look on the right at the Inspector panel, you'll see that this 
# script is listed at the top, which means that this script is linked to the button. 
# So essentialy, this script is linked to each individual style button. 

signal change_property(propertyID : int)
# signals are explained in the component_pick_button.gd script.

@export var property_id: int = 0
# @ export variables are explained in the component_pick_button.gd script.

# This tells the editor where the "MainDesignInfo" object
# is, which is needed because we will be using the things in
# that object in this script.
@onready var design_info : Node = Engine.get_main_loop().root.get_node("MainDesignInfo")
# Called when the node enters the scene tree for the first time.
# In other words, this runs the first frame that the button exists in.
# This is basically where you initialize things. 
func _ready() -> void:
	
	# This is signal-related code, which is explained in component_pick_button.gd
	self.pressed.connect(_button_pressed) 
	change_property.connect(design_info.change_property)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass # "pass" indicates an empty block of code.
		 # It is used for fucntions that you want to define
		 # but don't want to write code for yet.

func _button_pressed():
	# Sends out the "change_property" signal when this button is pressed.
	# The signal will run all the functions that are connected to it, and
	# it will send out the "property_id" variable so that other scripts can
	# use it.
	change_property.emit(property_id)
	
