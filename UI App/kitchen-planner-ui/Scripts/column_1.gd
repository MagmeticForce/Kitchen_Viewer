extends Control



# This script is responsible for toggling which menu is displayed
# based on which button the user presses. So for example, when the user presses
# the "Adjust Component" button, it makes the appropiate buttons display.

# These are all variables that refer to the various menus and options that are
# in the program, so that we can use them in this script.
@onready var input_dimensions_options: Control = $"../Column2/InputDimensionsOptions"
@onready var style_filters_options: Control = $"../Column2/StyleFiltersOptions"
@onready var adjust_component_options: Control = $"../Column2/AdjustComponentOptions"
@onready var load_design: Control = $"../Column2/LoadDesign"
@onready var view_design_options: Control = $"../Column2/ViewDesignOptions"
@onready var view_design_code: LineEdit = $"../Column2/ViewDesignOptions/DesignCode"
@onready var load_design_code: LineEdit = $"../Column2/LoadDesign/DesignCode"
@onready var main_design_info: Control = $".."

# This variable stores an object. Specifically, it is meant to store the menu that is active.
var active_func : Node = null

# This basically says "if this button is pressed, display this menu."
# Each button is assigned a number, and initial_id basically tells you which
# button was pressed. For more details, refer to the "initial_button.gd" script.
func change_shown_function(initial_id : int):
	if (active_func != null):
		active_func.visible = false
	if (initial_id == 0):
		active_func = input_dimensions_options
	elif (initial_id == 1):
		active_func = style_filters_options
	elif (initial_id == 2):
		active_func = adjust_component_options
		$"../Column2/AdjustComponentOptions/Properties".change_shown_properties(-1)

	elif (initial_id == 3):
		active_func = load_design
	elif (initial_id == 4):
		active_func = view_design_options
		view_design_code.text = main_design_info.output_code()
	active_func.visible = true
