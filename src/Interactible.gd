extends Area2D
class_name Interactible

signal used

# The following code is prescribed by Stalf#8366 of GDC discord
@export_range(0, 6) var icon = Enums.CURSORS.Door
@export var open:bool = true


####		Public Functions			########################################
func IsOpen() -> bool:
	return open

func Use():
	if not IsOpen(): return false
	emit_signal("used", self)
	Input.set_custom_mouse_cursor(GameState.Cursors[Enums.CURSORS.Default])

func HandleInput(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and IsOpen():
		Use()


####		Private Functions			########################################
####		Signal Listeners			########################################
func _onMouseEntered():
	if IsOpen():
		Input.set_custom_mouse_cursor(GameState.Cursors[icon])
	else:
		Input.set_custom_mouse_cursor(GameState.Cursors[Enums.CURSORS.Cancel])

func _onMouseExited():
	Input.set_custom_mouse_cursor(GameState.Cursors[Enums.CURSORS.Default])
