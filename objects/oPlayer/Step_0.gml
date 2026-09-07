keyLeft = keyboard_check(ord("A"))
keyRight = keyboard_check(ord("D"))
keyUp = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))
keyActivate = keyboard_check_pressed(vk_space)
keySprint = keyboard_check_pressed(vk_shift)
keyAttack = keyboard_check(ord("J"))
keyItem = keyboard_check(ord("I"))

inputDirection = point_direction(0,0, keyRight-keyLeft, keyDown-keyUp)
inputMagnitude = (keyRight-keyLeft !=0) || (keyDown-keyUp !=0) // Инпут активен или нет

if (!global.gamePaused) script_execute(state)

