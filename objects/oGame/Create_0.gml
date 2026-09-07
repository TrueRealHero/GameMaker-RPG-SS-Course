randomize()

// По фанчику добавил
game_speed = game_set_speed(60, gamespeed_fps);

global.gamePaused = false
global.iCamera = instance_create_layer(0,0,layer,oCamera)

room_goto(STARTROOM)