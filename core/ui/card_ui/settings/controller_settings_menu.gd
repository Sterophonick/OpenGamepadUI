extends Control

var SettingsManager := load("res://core/global/settings_manager.tres") as SettingsManager
@onready var allow_guideless_toggle = $%AllowGuidelessToggle

# Called when the node enters the scene tree for the first time.
func _ready():
	bool allow_guideless := SettingsManager.get_value("controllers", "allow_guideless_controllers", false) as bool
	allow_guideless_toggle.value = allow_guideless
	allow_guideless_toggle.value_changed.connect(_on_guideless_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_guideless_changed(value: bool) -> void:
	SettingsManager.set_value("controllers", "allow_guideless_controllers", value)
