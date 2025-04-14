extends MeshInstance3D

@export var material1 : StandardMaterial3D
@export var material2 : StandardMaterial3D
@export var material3 : StandardMaterial3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_material(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_material(material_id):
	if (material_id == 0):
		material_override = material1
	elif (material_id == 1):
		material_override = material2
	elif (material_id == 2):
		material_override = material3
