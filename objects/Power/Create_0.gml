image_speed = 0;

dh = 0;

ds = 0;

dv = 0;



if global.game = 2 and global.rand = 1 and global.lvl > 4{



        if (x = 240 and room_height = 960) or (x > 192 and x < 656 and room_height < 960){

            instance_create(x,y,Dot); global.p3x = 0; global.p3y = 0; instance_destroy(); oGameManager.dotcount = oGameManager.dotcount - 1;

        }


}


