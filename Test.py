import bpy
from math import radians



# Define some parameters that will be used in the script.
WALL_DISTANCE_FROM_CENTER = -2.5
WALL_HEIGHT = 50



################### Create one of the walls: ###################

# Get the object named "Cube" (which is the default cube) and save it into a variables named "wall_1"
wall_1 = bpy.data.objects.get("Cube")

if wall_1: # If "wall_1" was successfully created:
    wall_1.scale = (2.0, 0.5, WALL_HEIGHT)
    wall_1.location = (0.0, WALL_DISTANCE_FROM_CENTER, WALL_HEIGHT)
    
else: #If wall_1 failed to create
    print ("Wall 1 not found!")
    
    
  
################### Create another one of the walls: ###################
    
# Add a new Cube object
bpy.ops.mesh.primitive_cube_add (size=2.0, location=(WALL_DISTANCE_FROM_CENTER, 0.0, WALL_HEIGHT))

# Save the Cube object into a variable named "wall_2"
wall_2 = bpy.data.objects.get("Cube.001")

if wall_2: # If wall_2 was successfully created:
    wall_2.scale = (2.0, 0.5, WALL_HEIGHT)
    wall_2.rotation_euler = (radians(0), radians(0), radians(90))
else: # If wall_2 failed to create:
    print ("Wall 2 not found!")
    


################### Create the floor: ###################

# Add a new Cube object
bpy.ops.mesh.primitive_cube_add (size=2.0, location=(0.0, 0.0, 0.0))

# Save the Cube object into a variable named "floor"
floor = bpy.data.objects.get("Cube.002")

if floor: # If floor was successfully created:
    floor.scale = (2.0, 2.0, 0.5)
else: #If floor failed to create:
    print ("Floor not found!")