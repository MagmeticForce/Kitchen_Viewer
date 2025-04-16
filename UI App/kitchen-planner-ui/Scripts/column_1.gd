extends Control

@onready var input_dimensions_options: Control = $"../Column2/InputDimensionsOptions"
@onready var style_filters_options: Control = $"../Column2/StyleFiltersOptions"
@onready var adjust_component_options: Control = $"../Column2/AdjustComponentOptions"
@onready var load_design: Control = $"../Column2/LoadDesign"
@onready var view_design_options: Control = $"../Column2/ViewDesignOptions"
@onready var view_design_code: LineEdit = $"../Column2/ViewDesignOptions/DesignCode"
@onready var load_design_code: LineEdit = $"../Column2/LoadDesign/DesignCode"
@onready var main_design_info: Control = $".."

var active_func : Node = null

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
