extends Node

var messages: Array[String] = []
var money: float = 899
var items: Dictionary
var total_income: float = 0.0

func _physics_process(delta: float) -> void:
	money += snapped(total_income * delta, 0.01)
	Events.money_updated.emit(money)

func _update_total_income() -> void:
	total_income = 0.0
	for item: Item in items.keys():
		var count = items[item]
		total_income += item.income * count
	Events.total_income_updated.emit(total_income)

func push_message(msg: String) -> void:
	messages.append(msg)
	print(msg)
	Events.message_received.emit(msg)

func buy_item(item: Item) -> bool:
	if money < item.cost:
		push_message("Not enough money")
		return false
	money -= item.cost
	if items.has(item): items[item] += 1
	else: items.set(item, 0)
	_update_total_income()
	return true
