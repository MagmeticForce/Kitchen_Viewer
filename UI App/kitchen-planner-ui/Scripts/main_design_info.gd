extends Control
#--EXPORTS
#variables tracking currently active materials
@export var countertop: int = 0
@export var cabinet: int = 0
@export var stovetop: int = 0
@export var backsplash: int = 0
@export var fridge: int = 0
@export var microwave: int = 0
@export var oven: int = 0
@export var dishwasher: int = 0
@export var flooring: int = 0

#--REGULAR VARIABLES
#temporary variable tracking currently changing item
var current_item: int = 0

#--ONREADY
#text box that houses input code
@onready var design_code: LineEdit = $Column2/LoadDesign/DesignCode
#models requiring material changes
@onready var wall_1_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Wall1
@onready var wall_2_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Wall2
@onready var floor_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Floor
@onready var fridge_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Fridge
@onready var cabinet_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Cabinet
@onready var microwave_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Microwave
@onready var oven_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Oven
@onready var dishwasher_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Dishwasher
@onready var countertop_model: MeshInstance3D = $Column2/ViewDesignOptions/SubViewportContainer/SubViewport/Node3D/Countertop



#--FUNCTIONS
#function to change current item
func change_item(item_id):
	current_item = item_id

#function to change property of current item
func change_property(property_id):
	if (current_item == 0):
		countertop = property_id
	elif (current_item == 1):
		cabinet = property_id
	elif (current_item == 2):
		stovetop = property_id
	elif (current_item == 3):
		backsplash = property_id
	elif (current_item == 4):
		fridge = property_id
	elif (current_item == 5):
		microwave = property_id
	elif (current_item == 6):
		oven = property_id
	elif (current_item == 7):
		dishwasher = property_id
	elif (current_item == 8):
		flooring = property_id


		
#changes all materials for viewing and outputs a code to save the view
func output_code():
	wall_1_model.change_material(backsplash)
	wall_2_model.change_material(backsplash)
	floor_model.change_material(flooring)
	fridge_model.change_material(fridge)
	cabinet_model.change_material(cabinet)
	countertop_model.change_material(countertop)
	microwave_model.change_material(microwave)
	oven_model.change_material(oven)
	dishwasher_model.change_material(dishwasher)
	return (str(countertop)+","+str(cabinet)+","+str(stovetop)+","+str(backsplash)+","+str(fridge)+","+str(microwave)+","+str(oven)+","+str(dishwasher)+","+str(flooring))

func intake_code(input_string : String):
	var temp_string_array = input_string.split(",")
	
	if (temp_string_array.size() == 9):
		var i : int = 0
		for term in temp_string_array:
			if (int(term) < 0 || int(term) > 2):
				temp_string_array[i] = "0"
			i += 1
			
		countertop = int(temp_string_array[0])
		cabinet = int(temp_string_array[1])
		stovetop = int(temp_string_array[2])
		backsplash = int(temp_string_array[3])
		fridge = int(temp_string_array[4])
		microwave = int(temp_string_array[5])
		oven = int(temp_string_array[6])
		dishwasher = int(temp_string_array[7])
		flooring = int(temp_string_array[8])

	
func modern_style() -> void:
	intake_code("1,2,1,0,2,2,2,2,0")

func rustic_style() -> void:
	intake_code("2,1,0,2,0,0,0,0,1")

func minimalist_style() -> void:
	intake_code("0,0,2,1,1,1,1,1,2")


func submitted_code() -> void:
	intake_code(design_code.text)


#--UNIT TESTS
func _ready() -> void:
	intake_code("0,1,0,1,0,1,0,1,0")
	if (output_code() != "0,1,0,1,0,1,0,1,0"):
		print("ERROR ON TEST 1")
		print(output_code())
	intake_code("1,1,1,1,1,1,1,1,1")
	if (output_code() != "1,1,1,1,1,1,1,1,1"):
		print("ERROR ON TEST 2")
		print(output_code())
	intake_code("-1,9,-1,9,-1,9,-1,9,-1")
	if (output_code() != "0,0,0,0,0,0,0,0,0"):
		print("ERROR ON TEST 3")
		print(output_code())
