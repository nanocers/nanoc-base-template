$ ->
  console.log 'hello world'
  $(".aw_showcase").awShowcase
    content_width:			960
    content_height:			370
    fit_to_parent:			true
    auto:					false
    interval:				3000
    continuous:				false
    loading:				true
    tooltip_width:			200
    tooltip_icon_width:		32
    tooltip_icon_height:	32
    tooltip_offsetx:		18
    tooltip_offsety:		0
    arrows:					true
    buttons:				true
    btn_numbers:			false
    keybord_keys:			true
    mousetrace:				false # Trace x and y coordinates for the mouse */
    pauseonover:			true
    stoponclick:			false
    transition:				'fade' # hslide/vslide/fade */
    transition_delay:		0
    transition_speed:		500
    show_caption:			'onload' # onload/onhover/show */
    thumbnails:				false
    thumbnails_position:	'outside-last' # outside-last/outside-first/inside-last/inside-first */
    thumbnails_direction:	'vertical' # vertical/horizontal */
    thumbnails_slidex:		1 # 0 = auto / 1 = slide one thumbnail / 2 = slide two thumbnails / etc. */
    dynamic_height:			false # For dynamic height to work in webkit you need to set the width and height of images in the source. Usually works to only set the dimension of the first slide in the showcase. */
    speed_change:			true # Set to true to prevent users from swithing more then one slide at once. */
    viewline:				false # If set to true content_width thumbnails transition and dynamic_height will be disabled. As for dynamic height you need to set the width and height of images in the source. */
    custom_function:		null # Define a custom function that runs on content change */
