    ///move_state
    var right = keyboard_check(vk_right);
    var left =keyboard_check(vk_left);
    var up =keyboard_check(vk_up);
    var down = keyboard_check(vk_down);
    var up_release = keyboard_check_released(vk_up);
    var doubleJump = false;
    
    if(!place_meeting(x,y+1,Solid)){
       vspd += grav;
       
      
        if(up_release && vspd< -6){
         vspd = -6;
        }
    }   else{
        vspd = 0;
            if(up){
        
            vspd = -16;
            audio_play_sound(snd_jump,5, false);
            doubleJump = true;
            }
           // if(doubleJump && up){
             //vspd  = -10;
             //doubleJump = false;
             //}
    
    }
    
    
    if (right ){
        //sprite_index = spr_walk;
        hspd = spd;
        hspd_dir = -1;
    }
    if (left){
        //sprite_index = spr_walk_left;
        hspd = -spd;
        hspd_dir = -1;
    }
    if(hspd != 0){
        image_xscale = sign(hspd);
    }
    if(!right && !left){
    hspd = 0;
    }
    
    
    
    if (!right && !left){
     
        hspd = 0;
    }
    
    move(Solid);
    ///check for ledge gab state
    
    var falling = y-yprevious>0;
    var wasnt_wall = !position_meeting(x+17*image_xscale, yprevious, Solid);
    var is_wall = position_meeting(x+9*image_xscale, yprevious, Solid);
    
    if(falling && wasnt_wall && is_wall){
    
        hspd= 0;
        vspd=0;
       while (!place_meeting(x+image_xscale, y , Solid)){
        x+=image_xscale;
        }
        while (position_meeting(x+17*image_xscale, y-1 , Solid)){
        y -=1;
        }
       // sprite_index = spr_ledge_right;
       state = ledge_grab_state;
    }
    
    

