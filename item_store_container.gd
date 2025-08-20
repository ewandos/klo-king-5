extends VBoxContainer

@export var item: Item

@onready var preview_texture: TextureRect = $PreviewTexture
@onready var dixi_purchase_button: PurchaseButton = $DixiPurchaseButton

func _ready() -> void:
	dixi_purchase_button.item = item
	dixi_purchase_button.purchased.connect(_on_purchased)
	if not State.items.has(item): preview_texture.modulate.a = 0.33

func _on_purchased() -> void:
	preview_texture.modulate.a = 1.0
