function sickofit() {
	pause = 0; pause2 = 0
	if fright = true{
	    if eatdir = 0{hspeed = oGameManager.spfright; vspeed = 0; eatdir = -1}
	    if eatdir = 1{hspeed = oGameManager.spfright; vspeed = -spfright; eatdir = -1}
	    if eatdir = 2{hspeed = 0; vspeed = -spfright; eatdir = -1}
	    if eatdir = 3{hspeed = -spfright; vspeed = -spfright; eatdir = -1}
	    if eatdir = 4{hspeed = -spfright; vspeed = 0; eatdir = -1}
	    if eatdir = 5{hspeed = -spfright; vspeed = oGameManager.spfright; eatdir = -1}
	    if eatdir = 6{hspeed = 0; vspeed = oGameManager.spfright; eatdir = -1}
	    if eatdir = 7{hspeed = oGameManager.spfright; vspeed = oGameManager.spfright; eatdir = -1}
	    stoppy = 0;
	    if eatdir2 = 0{hspeed2 = oGameManager.spfright; vspeed2 = 0; eatdir2 = -1}
	    if eatdir2 = 1{hspeed2 = oGameManager.spfright; vspeed2 = -spfright; eatdir2 = -1}
	    if eatdir2 = 2{hspeed2 = 0; vspeed2 = -spfright; eatdir2 = -1}
	    if eatdir2 = 3{hspeed2 = -spfright; vspeed2 = -spfright; eatdir2 = -1}
	    if eatdir2 = 4{hspeed2 = -spfright; vspeed2 = 0; eatdir2 = -1}
	    if eatdir2 = 5{hspeed2 = -spfright; vspeed2 = oGameManager.spfright; eatdir2 = -1}
	    if eatdir2 = 6{hspeed2 = 0; vspeed2 = oGameManager.spfright; eatdir2 = -1}
	    if eatdir2 = 7{hspeed2 = oGameManager.spfright; vspeed2 = oGameManager.spfright; eatdir2 = -1}
	    stoppy2 = 0;
	}
	else{
	    if eatdir = 0{hspeed = oGameManager.sp; vspeed = 0; eatdir = -1}
	    if eatdir = 1{hspeed = oGameManager.sp; vspeed = -oGameManager.sp; eatdir = -1}
	    if eatdir = 2{hspeed = 0; vspeed = -oGameManager.sp; eatdir = -1}
	    if eatdir = 3{hspeed = -oGameManager.sp; vspeed = -oGameManager.sp; eatdir = -1}
	    if eatdir = 4{hspeed = -oGameManager.sp; vspeed = 0; eatdir = -1}
	    if eatdir = 5{hspeed = -oGameManager.sp; vspeed = oGameManager.sp; eatdir = -1}
	    if eatdir = 6{hspeed = 0; vspeed = oGameManager.sp; eatdir = -1}
	    if eatdir = 7{hspeed = oGameManager.sp; vspeed = oGameManager.sp; eatdir = -1}
	    stoppy = 0;
	    if eatdir2 = 0{hspeed2 = oGameManager.sp; vspeed2 = 0; eatdir2 = -1}
	    if eatdir2 = 1{hspeed2 = oGameManager.sp; vspeed2 = -oGameManager.sp; eatdir2 = -1}
	    if eatdir2 = 2{hspeed2 = 0; vspeed2 = -oGameManager.sp; eatdir2 = -1}
	    if eatdir2 = 3{hspeed2 = -oGameManager.sp; vspeed2 = -oGameManager.sp; eatdir2 = -1}
	    if eatdir2 = 4{hspeed2 = -oGameManager.sp; vspeed2 = 0; eatdir2 = -1}
	    if eatdir2 = 5{hspeed2 = -oGameManager.sp; vspeed2 = oGameManager.sp; eatdir2 = -1}
	    if eatdir2 = 6{hspeed2 = 0; vspeed2 = oGameManager.sp; eatdir2 = -1}
	    if eatdir2 = 7{hspeed2 = oGameManager.sp; vspeed2 = oGameManager.sp; eatdir2 = -1}
	    stoppy2 = 0;
	}       



}
