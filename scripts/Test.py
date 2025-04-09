

import bpy
from math import radians

# Define some parameters that will be used in the script.
WALL_DISTANCE_FROM_CENTER = -2.5
WALL_HEIGHT = 2.5



################### Create one of the walls: ###################

# Get the object named "Cube" (which is the default cube that's automatically created) and save it into a variables named "wall_1"
wall_1 = bpy.data.objects.get("Cube")

if wall_1: # If "wall_1" was successfully assigned:
    wall_1.scale = (2.0, 0.5, WALL_HEIGHT)
    wall_1.location = (0.0, WALL_DISTANCE_FROM_CENTER, WALL_HEIGHT)
    
else: #If wall_1 failed to create
    print ("Wall 1 not found!")
    
    
  
################### Create another one of the walls: ###################
    
# Add a new Cube object
bpy.ops.mesh.primitive_cube_add (size=2.0, location=(WALL_DISTANCE_FROM_CENTER, 0.0, WALL_HEIGHT), scale = (2.0, 0.5, WALL_HEIGHT))

# Save the Cube object into a variable named "wall_2"
wall_2 = bpy.data.objects.get("Cube.001")

if wall_2: # If wall_2 was successfully created:
    wall_2.rotation_euler = (radians(0), radians(0), radians(90))
else: # If wall_2 failed to create:
    print ("Wall 2 not found!")
 
    

################### Create the floor: ###################

# Add a new Cube object
bpy.ops.mesh.primitive_cube_add (size=2.0, location=(0.0, 0.0, 0.0), scale = (2.0, 2.0, 0.5))

# Save the Cube object into a variable named "floor"
floor = bpy.data.objects.get("Cube.002")
    
    

################### Create an example cube: ###################

# Add a new Cube object
bpy.ops.mesh.primitive_cube_add (size=2.0, location=(0.0, 0.0, 2.0), scale = (1, 1, 1))

# Save the Cube object into a variable named "sample_cube"
sample_cube = bpy.data.objects.get("Cube.003")



################### Create an example texture: ###################

# To create a new texture, copy+paste the code below and change these things in your copied code:
# * Replace "MyNewMat" with something else
# * Replace every "sample_material" with something different. 
# * Replace every "sample_material_nodes" with something different. 
# * Replace every "sample_material_node_links" with something different.
# * Replace every "sample_material_principled_bsdf_node" with something different. 
# * Replace every "sample_texture_node" with something different.
# * Change the file path so it points to your new texture.
# * Change "sample_cube" to the object you want to assign the texture to.

sample_material = bpy.data.materials.new(name="MyNewMat")
sample_material.use_nodes = True
sample_material_nodes = sample_material.node_tree.nodes
sample_material_node_links = sample_material.node_tree.links

sample_texture_node = sample_material_nodes.new(type="ShaderNodeTexImage")
sample_texture_node.image = bpy.data.images.load("C:\\Pictures\\Cube_UV_Reference.png") # <----------------- CHANGE THIS PATH!!! This is the absolute path to the texture.

sample_material_principled_bsdf_node = sample_material_nodes.get("Principled BSDF")
sample_material_node_links.new(sample_texture_node.outputs['Color'], sample_material_principled_bsdf_node.inputs['Base Color'])


if len(sample_cube.data.materials) == 0: # If the length of the array that contains all of sample_cube's materials is 0
                                         # (so empty, in other words)...
    sample_cube.data.materials.append(sample_material) # Add our new material to the array
else: # If the array that contains all of sample_cube's materials is NOT empty...
    sample_cube.data.materials[0] = sample_material # Insert our new material into the first slot


    
################### Change the viewport shading: ###################

for each_individual_area in bpy.context.screen.areas:
    if each_individual_area.type == 'VIEW_3D':
        for each_individual_space in each_individual_area.spaces:
            if each_individual_space.type == 'VIEW_3D':
                each_individual_space.shading.type = 'RENDERED'
                
                break
