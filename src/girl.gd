extends CharacterBody2D


var speed:Vector2 = Vector2(100.0, 50.0)
var destination:Vector2
var target


####		Built-in Functions			########################################
func _ready():
	Player.SetCharacter(self)

func _physics_process(delta):
	var goal:Vector2 = $navAgent2D.get_next_path_position()
	var dir = goal - position
	
#	if dir.length() > 4:
#		velocity = dir.normalized() * speed
#	else:
#		velocity = Vector2()
	if dir.x > 1 or dir.x < -1:
		velocity.x = clamp(dir.x, -speed.x, speed.x)
	else:
		velocity.x = 0
#		velocity.x = move_toward(velocity.x, 0, speed.x/2.0)
	if dir.y > 1 or dir.y < -1:
		velocity.y =clamp(dir.y, -speed.y, speed.y)
	else:
		velocity.y = 0
#		velocity.y = move_toward(velocity.y, 0, speed.y/2.0)
	move_and_slide()


####		Public Functions			########################################
func SetDestination(vec:Vector2):
	destination = vec
	$navAgent2D.target_position = vec

# Used to set start points when entering a Location.
# BREAKS KINEMATICS IF OVERUSED.
func SetPosition(vec:Vector2):
	position = vec
	SetDestination(vec)


####		Private Functions			########################################
####		Signal Listeners			########################################
