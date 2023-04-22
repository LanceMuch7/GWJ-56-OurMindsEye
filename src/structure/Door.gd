extends Interactible


@export_file var dest:String
@export var destDoor:String
@export_file var sfxName:String
var conditions : Array = []		#Locked/unlocked conditions


####		Built-in Functions			########################################
func _ready():
	if sfxName.length() > 0:
		$Sound.stream = load(sfxName)


####		Public Functions			########################################
func IsOpen() -> bool:
	if not open: return false
#	for c in conditions:
#		pass
		# call or use signal to ask if condition is met
		# alternately, require all sources to remove their conditions once met
	return true

func Use():
	if not IsOpen(): return false
	# trigger a scene change
	emit_signal("used", self)
	if sfxName.length() > 0:
#		AudioMgr.PlayInForeground(sfxName, sfxType)
		$Sound.play()
	
	Input.set_custom_mouse_cursor(GameState.Cursors[Enums.CURSORS.Default])
	Player.SelectObject(self)

func HandleInput(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and IsOpen():
		Use()


####		Private Functions			########################################
####		Signal Listeners			########################################
func _onMouseEntered():
	super._onMouseEntered()

func _onMouseExited():
	super._onMouseExited()

func _onBodyEntered(body):
	if dest.get_file().length() == 0:
		push_warning("Missing door destination: \"" + dest + "\"")
		return
	GameState.LoadScene(dest, destDoor)
