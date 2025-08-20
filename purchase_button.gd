@tool
class_name PurchaseButton
extends Button

signal purchased

@export var item: Item:
	set = _set_item

func _ready() -> void:
	pressed.connect(_on_pressed)
	
func _on_pressed() -> void:
	var success = State.buy_item(item)
	if success: purchased.emit()
	
func _process(delta: float) -> void:
	if Engine.is_editor_hint(): return
	disabled = State.money < item.cost

func _set_item(n_item) -> void:
	item = n_item
	text = "Buy %s (%s$)" % [item.name, var_to_str(item.cost)]
