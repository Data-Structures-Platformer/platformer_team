tool
extends TouchScreenButton

export var radius := 60.0 setget set_radius
export var points := 5 setget set_points
export var angle := 0.0 setget set_angle
export var deadzone := 3.0 setget set_deadzone
export var poly_path : NodePath = ""
onready var poly : Polygon2D = get_node_or_null(poly_path)
export var inner_radius := 50.0 setget set_inner_radius
export var inner_offset := 5.0 setget set_inner_offset

# Auto-scaling options
export var auto_scale := true
export var max_size_percent := 0.05 # Maximum 5% of screen width

var _scaled := false

func _ready():
	# Only scale when actually running the game, not in editor
	if auto_scale and not Engine.editor_hint:
		call_deferred("fit_to_screen")
	else:
		act()
		inner_act()

func fit_to_screen():
	if _scaled:
		return
	_scaled = true
	
	var viewport_size = get_viewport_rect().size
	var min_dimension = min(viewport_size.x, viewport_size.y)
	
	# Calculate a reasonable size (much smaller)
	var new_radius = min_dimension * max_size_percent
	
	# Ensure it doesn't exceed original design size
	new_radius = min(new_radius, 60.0)
	
	radius = new_radius
	
	# Scale inner radius proportionally
	var ratio = 50.0 / 60.0  # Use original ratio
	inner_radius = new_radius * ratio
	inner_offset = 5.0 * (new_radius / 60.0)
	
	# Force update the shape
	act()
	inner_act()
	
	print("Joystick scaled to radius: ", radius)

func set_radius(arg := radius):
	radius = arg
	if not Engine.editor_hint or _scaled:
		act()

func set_points(arg := points):
	points = arg
	act()

func set_angle(arg := angle):
	angle = arg
	act()

func set_deadzone(arg := deadzone):
	deadzone = arg
	act()

func set_inner_radius(arg := inner_radius):
	inner_radius = arg
	inner_act()

func set_inner_offset(arg := inner_offset):
	inner_offset = arg
	inner_act()

func act():
	shape = ConvexPolygonShape2D.new()
	shape.points = make_shape()

func inner_act():
	if is_instance_valid(poly):
		poly.polygon = make_shape(inner_radius)
		poly.position = Vector2(inner_offset, 0).rotated(deg2rad(angle))

func make_shape(_radius := radius, _points := points, _angle := angle, _deadzone := deadzone):
	var r = Vector2(_radius, 0)
	var vec = PoolVector2Array()
	
	for i in [1, 0, -1]:
		vec.append(Vector2(_deadzone, 0).rotated(deg2rad(_angle + (i * 45))))
	
	for i in _points:
		var f = i / float(_points - 1)
		vec.append(r.rotated(deg2rad(_angle + lerp(-45, 45, f))))
	
	return vec
