extends MeshInstance3D



# This script creates the 3D objects whose textures can be swapped. 
# If you go to to Scene window on the left and navigate to 
# MainDesignInfo > Column2 > ViewDesignOptions > SubViewportContainer > 
# Subviewport > Node3D and select one of those objects, and then look to
# the right at the Inspector panel, you'll see that this "object_change.gd"
# script is attached to the object.

# Define variables that store the three textures that will be applied to
# this object based on which style the user selects:
@export var material1 : StandardMaterial3D
@export var material2 : StandardMaterial3D
@export var material3 : StandardMaterial3D
# @ export variables are explained in the component_pick_button.gd script.

# Called when the node enters the scene tree for the first time.
# In other words, this runs the first frame that the button exists in.
# This is basically where you initialize things. 
func _ready() -> void:
	change_material(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass # "pass" indicates an empty block of code.
		 # It is used for fucntions that you want to define
		 # but don't want to write code for yet.

func change_material(material_id):
	if (material_id == 0):
		material_override = material1
	elif (material_id == 1):
		material_override = material2
	elif (material_id == 2):
		material_override = material3
