extends Control

@onready var countertop: Control = $Countertop
@onready var cabinet: Control = $Cabinet
@onready var stovetop: Control = $Stovetop
@onready var backsplash: Control = $Backsplash
@onready var fridge: Control = $Fridge
@onready var microwave: Control = $Microwave
@onready var oven: Control = $Oven
@onready var dishwasher: Control = $Dishwasher
@onready var flooring: Control = $Flooring

var active_item : Node = null

func change_shown_properties(item_id : int):
	if (active_item != null):
		active_item.visible = false
	if (item_id == 0):
		active_item = countertop
	elif (item_id == 1):
		active_item = cabinet
	elif (item_id == 2):
		active_item = stovetop
	elif (item_id == 3):
		active_item = backsplash
	elif (item_id == 4):
		active_item = fridge
	elif (item_id == 5):
		active_item = microwave
	elif (item_id == 6):
		active_item = oven
	elif (item_id == 7):
		active_item = dishwasher
	elif (item_id == 8):
		active_item = flooring
	elif (item_id == -1):
		active_item = null
	if (active_item != null):
		active_item.visible = true
