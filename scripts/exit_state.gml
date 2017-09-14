///Exit

if(image_alpha>0){
    image_alpha -= .25;
}else{
    if(room != room_last){
    sprite_index = spr_exit;
    room_goto_next();
    } else {
    game_restart();
    }
    }
