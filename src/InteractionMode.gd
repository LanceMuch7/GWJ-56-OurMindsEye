extends Sprite2D
class_name InteractionMode


####	Constants				################################################
####	Variables				################################################
@export var BackgroundPath = "Outpost_Overview"


####	Built-in Functions		################################################
####	Public Functions		################################################
# virtual function that allows children to do any "upon enter" initialization
func Activate():
	show()

func Pause():
	hide()

####	Private Functions		################################################
