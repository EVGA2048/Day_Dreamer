#代码构建日期2023_7_30Sun xxAp2005,darkxmic   最近更新时间2023_7_31Mon 21:19
'''extends CharacterBody2D


const ACCELERATION = 10                                                                             #设置加速度
const MAX_SPEED = 100                                                                               #设置最大速度（常量）
const FRICTION = 10                                                                                 #设置摩擦力


func _ready():                                                                                      #初始化
	print("Player已初始化")

func _physics_process(delta):                                                                       #每一帧更新 约1/60s一次更新（根据delta变化）
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")          #将输入x轴向量设为 控制输入的左右差
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")             #将输入y轴向量设为 控制输入的上下差
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:                                                                       #判断向量不等于0
		velocity += input_vector * ACCELERATION * delta                                                    #将速度设为输入向量xy
		velocity = velocity.limit_length(MAX_SPEED) * delta                                                #限制速度(按照帧数)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)                                    #否则将速度设为0向量
		
	print(velocity)	
	move_and_collide(velocity)                                                                             #返回速度值到移动碰撞
 '''





extends  CharacterBody2D
@export var speed = 100.0

func _physics_process(delta):
		var dir = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)
		
		velocity = dir * speed
		move_and_slide()
