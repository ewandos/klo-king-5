extends Control

@onready var label: Label = $Label
@onready var message_display: Label = $MessageDisplay
@onready var income_label: Label = $IncomeLabel

func _ready() -> void:
	Events.money_updated.connect(func(money): label.text = "%s$" % var_to_str(money))
	Events.message_received.connect(func(msg): message_display.text = msg)
	Events.total_income_updated.connect(func(income): income_label.text = "+%s$" % var_to_str(income))

func _on_shop_button_pressed() -> void:
	pass # Replace with function body.
