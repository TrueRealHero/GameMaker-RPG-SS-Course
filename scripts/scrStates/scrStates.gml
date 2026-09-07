function StateFree(){
   vSpeed = lengthdir_y(inputMagnitude * walkspeed, inputDirection)
   hSpeed = lengthdir_x(inputMagnitude * walkspeed, inputDirection)
   
   PlayerCollision()
   
   var _oldSprite = sprite_index
   if (inputMagnitude != 0) {
       direction = inputDirection
       sprite_index = spriteRun
   } else sprite_index = spriteIdle
   
   if (_oldSprite != sprite_index) localFrame = 0
    
   /*if (keySprint){
         walkspeed = runspeed
   } else walkspeed = walkspeed*/// ДОДЕЛАТЬ
       
   PlayerAnimation() 
    
   if (keyActivate){
        state = StateRoll;
        moveDistanceRemaining = rollDistance
   }
}

function StateRoll(){
    hSpeed = lengthdir_x(rollSpeed, direction)
    vSpeed = lengthdir_y(rollSpeed, direction)
    
    moveDistanceRemaining = max (0, moveDistanceRemaining - rollSpeed);
    var _collided = PlayerCollision();
    
    sprite_index = spriteRoll;
    var _totalFrames = sprite_get_number(sprite_index) / 4;
    /*image_index = (CAR_DIR * _totalFrames) + 
                min(((1 - (moveDistanceRemaining / rollDistance)) *
                (_totalFrames)), _totalFrames - 1); */
    
    // Насколько перекат завершён: 0..1
    var _progress = 1 - (moveDistanceRemaining / rollDistance);
    
    // Какой кадр внутри направления
    var _frame = min( _progress * _totalFrames, _totalFrames - 1 );
    
    // Выбираем направление + кадр.
    // Формула типа (строка × размер_строки + столбец), перевод матрицы в строку.
    image_index = CAR_DIR * _totalFrames + _frame;
    
    if (moveDistanceRemaining <= 0) state = StateFree;
        
    if (_collided){
        state = StateFree;
        ScreenShake(4,20)}
}