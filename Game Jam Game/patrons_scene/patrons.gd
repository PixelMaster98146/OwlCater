extends Node3D
@onready var patron = [$Models/Patron1, $Models/Patron2, $Models/Patron3, $Models/Patron4]

@onready var path1 = %PathFollow3D1
@onready var path2 = %PathFollow3D2
@onready var path3 = %PathFollow3D3
@onready var path4 = %PathFollow3D4
@onready var path5 = %PathFollow3D5
@onready var path6 = %PathFollow3D6
@onready var path7 = %PathFollow3D7
@onready var path8 = %PathFollow3D8
@onready var path9 = %PathFollow3D9
@onready var path10 = %PathFollow3D10

var moving1 = true
var moving2 = true
var moving3 = true
var moving4 = true
var moving5 = true
var moving6 = true
var moving7 = true
var moving8 = true
var moving9 = true
var moving10 = true

var counter_full = false #Set all back to false on leaving/order complete
var line1_full = false
var line2_full = false
var line3_full = false
var line4_full = false
var line5_full = false
var line6_full = false
var line7_full = false
var line8_full = false
var line9_full = false
var line10_full = false

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1).timeout
	path()
	$PatronTimer.start() #not connected
	await get_tree().create_timer(1).timeout
	path()
	await get_tree().create_timer(1).timeout
	path()
	await get_tree().create_timer(1).timeout
	path()
	await get_tree().create_timer(1).timeout
	path()
	await get_tree().create_timer(1).timeout
	path()
	await get_tree().create_timer(1).timeout
	path()
	await get_tree().create_timer(1).timeout
	path()
	#await get_tree().create_timer(3).timeout
	#path()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	#print("working")
	const move_speed := 10.0#4.0
	if moving1 == true:
		path1.progress += move_speed * delta
	if moving2 == true:
		path2.progress += move_speed * delta
	if moving3 == true:
		path3.progress += move_speed * delta
	if moving4 == true:
		path4.progress += move_speed * delta
	if moving5 == true:
		path5.progress += move_speed * delta
	if moving6 == true:
		path6.progress += move_speed * delta
	if moving7 == true:
		path7.progress += move_speed * delta
	if moving8 == true:
		path8.progress += move_speed * delta
	if moving9 == true:
		path9.progress += move_speed * delta
	if moving10 == true:
		path10.progress += move_speed * delta
	
func path(): #change to _on_patron_timer_timeout
	var line_wait = false #if person is waiting = true
	var customer = patron.pick_random()
	var _customer1 = customer.duplicate()
	var _customer2 = customer.duplicate()
	var _customer3 = customer.duplicate()
	var _customer4 = customer.duplicate()
	var _customer5 = customer.duplicate()
	var _customer6 = customer.duplicate()
	var _customer7 = customer.duplicate()
	var _customer8 = customer.duplicate()
	var _customer9 = customer.duplicate()
	var _customer10 = customer.duplicate()
	if path1.get_child_count() == 0 and line_wait == false:
		print("1")
		path1.add_child(_customer1)
		path1.progress = 0
	elif path1.get_child_count() == 1 and path2.get_child_count() == 0:
		print("2")
		path2.add_child(_customer2)
		path2.progress = 0
	elif path2.get_child_count() == 1 and path3.get_child_count() == 0:
		print("3")
		path3.add_child(_customer3)
		path3.progress = 0
	elif path3.get_child_count() == 1 and path4.get_child_count() == 0:
		print("4")
		path4.add_child(_customer4)
		path4.progress = 0
	elif path4.get_child_count() == 1 and path5.get_child_count() == 0:
		print("5")
		path5.add_child(_customer5)
		path5.progress = 0
	elif path5.get_child_count() == 1 and path6.get_child_count() == 0:
		print("6")
		path6.add_child(_customer6)
		path6.progress = 0
	elif path6.get_child_count() == 1 and path7.get_child_count() == 0:
		print("7")
		path7.add_child(_customer7)
		path7.progress = 0
	elif path7.get_child_count() == 1 and path8.get_child_count() == 0:
		print("8")
		path8.add_child(_customer8)
		path8.progress = 0
	elif path8.get_child_count() == 1 and path9.get_child_count() == 0:
		print("9")
		path9.add_child(_customer9)
		path9.progress = 0
	elif path9.get_child_count() == 1 and path10.get_child_count() == 0:
		print("10")
		path10.add_child(_customer10)
		path10.progress = 0
	else:
		print("pass")
		pass

func _on_patron_leave_body_entered(body):
	body.get_parent().queue_free()

func _on_counter_body_entered(body):
	var counter_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if counter_stop == path1:
		moving1 = false
	if counter_stop == path2:
		moving2 = false
	if counter_stop == path3:
		moving3 = false
	if counter_stop == path4:
		moving4 = false
	if counter_stop == path5:
		moving5 = false
	if counter_stop == path6:
		moving6 = false
	if counter_stop == path7:
		moving7 = false
	if counter_stop == path8:
		moving8 = false
	if counter_stop == path9:
		moving9 = false
	if counter_stop == path10:
		moving10 = false
	#model.rotate
	counter_full = true

func _on_line_up_1_body_entered(body):
	var line1_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if counter_full == true:
		if line1_stop == path1:
			moving1 = false
		if line1_stop == path2:
			moving2 = false
		if line1_stop == path3:
			moving3 = false
		if line1_stop == path4:
			moving4 = false
		if line1_stop == path5:
			moving5 = false
		if line1_stop == path6:
			moving6 = false
		if line1_stop == path7:
			moving7 = false
		if line1_stop == path8:
			moving8 = false
		if line1_stop == path9:
			moving9 = false
		if line1_stop == path10:
			moving10 = false
		#model.rotate
		line1_full = true

func _on_line_up_2_body_entered(body):
	var line2_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if line1_full == true:
		if line2_stop == path1:
			moving1 = false
		if line2_stop == path2:
			moving2 = false
		if line2_stop == path3:
			moving3 = false
		if line2_stop == path4:
			moving4 = false
		if line2_stop == path5:
			moving5 = false
		if line2_stop == path6:
			moving6 = false
		if line2_stop == path7:
			moving7 = false
		if line2_stop == path8:
			moving8 = false
		if line2_stop == path9:
			moving9 = false
		if line2_stop == path10:
			moving10 = false
		#model.rotate
		line2_full = true

func _on_line_up_3_body_entered(body):
	var line3_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if line2_full == true:
		if line3_stop == path1:
			moving1 = false
		if line3_stop == path2:
			moving2 = false
		if line3_stop == path3:
			moving3 = false
		if line3_stop == path4:
			moving4 = false
		if line3_stop == path5:
			moving5 = false
		if line3_stop == path6:
			moving6 = false
		if line3_stop == path7:
			moving7 = false
		if line3_stop == path8:
			moving8 = false
		if line3_stop == path9:
			moving9 = false
		if line3_stop == path10:
			moving10 = false
		#model.rotate
		line3_full = true

func _on_line_up_4_body_entered(body):
	var line4_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if line3_full == true:
		if line4_stop == path1:
			moving1 = false
		if line4_stop == path2:
			moving2 = false
		if line4_stop == path3:
			moving3 = false
		if line4_stop == path4:
			moving4 = false
		if line4_stop == path5:
			moving5 = false
		if line4_stop == path6:
			moving6 = false
		if line4_stop == path7:
			moving7 = false
		if line4_stop == path8:
			moving8 = false
		if line4_stop == path9:
			moving9 = false
		if line4_stop == path10:
			moving10 = false
		#model.rotate
		line4_full = true

func _on_line_up_5_body_entered(body):
	var line5_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if line4_full == true:
		if line5_stop == path1:
			moving1 = false
		if line5_stop == path2:
			moving2 = false
		if line5_stop == path3:
			moving3 = false
		if line5_stop == path4:
			moving4 = false
		if line5_stop == path5:
			moving5 = false
		if line5_stop == path6:
			moving6 = false
		if line5_stop == path7:
			moving7 = false
		if line5_stop == path8:
			moving8 = false
		if line5_stop == path9:
			moving9 = false
		if line5_stop == path10:
			moving10 = false
		#model.rotate
		line5_full = true

func _on_line_up_6_body_entered(body):
	var line6_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if line5_full == true:
		if line6_stop == path1:
			moving1 = false
		if line6_stop == path2:
			moving2 = false
		if line6_stop == path3:
			moving3 = false
		if line6_stop == path4:
			moving4 = false
		if line6_stop == path5:
			moving5 = false
		if line6_stop == path6:
			moving6 = false
		if line6_stop == path7:
			moving7 = false
		if line6_stop == path8:
			moving8 = false
		if line6_stop == path9:
			moving9 = false
		if line6_stop == path10:
			moving10 = false
		#model.rotate
		line6_full = true
		
func _on_line_up_7_body_entered(body):
	var line7_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if line6_full == true:
		if line7_stop == path1:
			moving1 = false
		if line7_stop == path2:
			moving2 = false
		if line7_stop == path3:
			moving3 = false
		if line7_stop == path4:
			moving4 = false
		if line7_stop == path5:
			moving5 = false
		if line7_stop == path6:
			moving6 = false
		if line7_stop == path7:
			moving7 = false
		if line7_stop == path8:
			moving8 = false
		if line7_stop == path9:
			moving9 = false
		if line7_stop == path10:
			moving10 = false
		#model.rotate
		line7_full = true


func _on_line_up_8_body_entered(body):
	var line8_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if line7_full == true:
		if line8_stop == path1:
			moving1 = false
		if line8_stop == path2:
			moving2 = false
		if line8_stop == path3:
			moving3 = false
		if line8_stop == path4:
			moving4 = false
		if line8_stop == path5:
			moving5 = false
		if line8_stop == path6:
			moving6 = false
		if line8_stop == path7:
			moving7 = false
		if line8_stop == path8:
			moving8 = false
		if line8_stop == path9:
			moving9 = false
		if line8_stop == path10:
			moving10 = false
		#model.rotate
		line8_full = true

func _on_line_up_9_body_entered(body):
	var line9_stop = body.get_parent().get_parent()
	var model = body.get_parent()
	if line8_full == true:
		if line9_stop == path1:
			moving1 = false
		if line9_stop == path2:
			moving2 = false
		if line9_stop == path3:
			moving3 = false
		if line9_stop == path4:
			moving4 = false
		if line9_stop == path5:
			moving5 = false
		if line9_stop == path6:
			moving6 = false
		if line9_stop == path7:
			moving7 = false
		if line9_stop == path8:
			moving8 = false
		if line9_stop == path9:
			moving9 = false
		if line9_stop == path10:
			moving10 = false
		#model.rotate
		line9_full = true #used to stop customers from spawning