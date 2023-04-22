extends CharacterBody2D

var speed:Vector2 = Vector2(100.0, 50.0)
var destination:Vector2
var target:Node2D


####		Built-in Functions			########################################
func _ready():
	Player.SetCharacter(self)
	await get_tree().create_timer(0.2).timeout
	collision_layer = 2

func _physics_process(delta):
	var goal:Vector2 = $navAgent2D.get_next_path_position()
	var dir = goal - position
	
	if dir.length() > 1:
		velocity = dir.normalized() * speed
	else:
		velocity = Vector2()
	move_and_slide()


####		Public Functions			########################################
func SetDestination(vec:Vector2):
	destination = vec
	$navAgent2D.target_position = vec

func SetTarget(tgt:Node2D):
	target = tgt
	SetDestination(tgt.global_position)

# Used to set start points when entering a Location.
# BREAKS KINEMATICS IF OVERUSED.
func SetPosition(vec:Vector2):
	position = vec
	SetDestination(vec*0.8)


####		Private Functions			########################################
####		Signal Listeners			########################################
