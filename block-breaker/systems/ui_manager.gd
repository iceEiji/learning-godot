extends Node

const BASE_FONT_SIZE: float = 32.0
const SCALE_RATIO: float = 1.333

const FONT_SIZE_SM: int   = int(BASE_FONT_SIZE / SCALE_RATIO)     # 24
const FONT_SIZE_BASE: int = int(BASE_FONT_SIZE)                    # 32
const FONT_SIZE_LG: int   = int(BASE_FONT_SIZE * SCALE_RATIO)     # 43
const FONT_SIZE_XL: int   = int(BASE_FONT_SIZE * SCALE_RATIO**2)  # 57
const FONT_SIZE_2XL: int  = int(BASE_FONT_SIZE * SCALE_RATIO**3)  # 76

const COLOR_WHITE: Color   = Color(1, 1, 1)
const COLOR_LIGHT_GRAY: Color   = Color(0.75, 0.75, 0.75)
const COLOR_GRAY: Color   = Color(0.5, 0.5, 0.5)
const COLOR_DARK_GRAY: Color   = Color(0.25, 0.25, 0.25)
const COLOR_BLACK: Color   = Color(0, 0, 0)
const COLOR_PRIMARY: Color = Color(0.2, 0.6, 1.0)
const COLOR_DANGER: Color  = Color(1.0, 0.3, 0.3)
const COLOR_SUCCESS: Color = Color(0.3, 1.0, 0.5)

const CORNER_RADIUS: float = 8.0

const SPACE_XS: float = 8.0
const SPACE_SM: float = 16.0
const SPACE_MD: float = 32.0
const SPACE_LG: float = 64.0
const SPACE_XL: float = 128.0

const Z_BACKGROUND: int = -1
const Z_DEFAULT: int    = 0
const Z_EFFECT: int     = 10
const Z_UI: int         = 100

var theme: Theme

func _ready() -> void:
	theme = _create_theme()

func _create_theme() -> Theme:
	var t = Theme.new()
	var font = load("res://assets/fonts/Xolonium-Regular.ttf")
	t.default_font = font
	t.default_font_size = FONT_SIZE_BASE
	_setup_label(t)
	_setup_button(t)
	return t

func _setup_label(t: Theme) -> void:
	t.set_type_variation("TitleLabel", "Label")
	t.set_font_size("font_size", "TitleLabel", FONT_SIZE_2XL)
	t.set_color("font_color", "TitleLabel", COLOR_WHITE)

	t.set_type_variation("BodyLabel", "Label")
	t.set_font_size("font_size", "BodyLabel", FONT_SIZE_BASE)
	t.set_color("font_color", "BodyLabel", COLOR_WHITE)

func _setup_button(t: Theme) -> void:
	var style = StyleBoxFlat.new()
	style.content_margin_left = SPACE_MD
	style.content_margin_right = SPACE_MD
	style.content_margin_top = SPACE_SM
	style.content_margin_bottom = SPACE_SM
	style.bg_color = COLOR_GRAY
	style.set_corner_radius_all(CORNER_RADIUS)

	t.set_type_variation("PrimaryButton", "Button")
	t.set_font_size("font_size", "PrimaryButton", FONT_SIZE_LG)
	t.set_color("font_color", "BodyLabel", COLOR_WHITE)
	t.set_stylebox("normal", "PrimaryButton", style)
	t.set_stylebox("hover", "PrimaryButton", style)
	t.set_stylebox("pressed", "PrimaryButton", style)
	t.set_stylebox("focus", "PrimaryButton", style)
	t.set_stylebox("disabled", "PrimaryButton", style)
