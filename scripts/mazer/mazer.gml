function mazer() {
	if global.game = 2{
	    if global.mode = 0{
	        if global.lvl = 0{room_goto(JrPacMan1);}
	        if global.lvl = 1{room_goto(JrPacMan2);}
	        if global.lvl = 2{room_goto(JrPacMan3);}
	        if global.lvl = 3{room_goto(JrPacMan4);}
	        if global.lvl = 4{room_goto(JrPacMan5);}
	        if global.lvl = 5{room_goto(JrPacMan6);}
	        if global.lvl = 6{room_goto(JrPacMan7);}
	        if global.lvl = 7{room_goto(JrPacMan4);}
	        if global.lvl = 8{room_goto(JrPacMan5);}
	        if global.lvl = 9{room_goto(JrPacMan6);}
	    }
	    if global.mode = 1{
	        if global.lvl = 0{room_goto(VS1);}
	        if global.lvl = 1{room_goto(VS2);}
	        if global.lvl = 2{room_goto(VS3);}
	        if global.lvl = 3{room_goto(VS4);}
	        if global.lvl = 4{room_goto(VS5);}
	        if global.lvl = 5{room_goto(VS6);}
	        if global.lvl = 6{room_goto(VS7);}
	        if global.lvl = 7{room_goto(VS4);}
	        if global.lvl = 8{room_goto(VS5);}
	        if global.lvl = 9{room_goto(VS6);}
	    }
	    if global.mode = 2{
	        if global.lvl = 0{room_goto(C64_01);}
	        if global.lvl = 1{room_goto(C64_02);}
	        if global.lvl = 2{room_goto(C64_03);}
	        if global.lvl = 3{room_goto(C64_04);}
	        if global.lvl = 4{room_goto(C64_05);}
	        if global.lvl = 5{room_goto(C64_06);}
	        if global.lvl = 6{room_goto(C64_03);}
	        if global.lvl = 7{room_goto(C64_04);}
	        if global.lvl = 8{room_goto(C64_05);}
	        if global.lvl = 9{room_goto(C64_06);}
	    }
	    if global.mode = 3{
	        if global.lvl = 0{room_goto(A2600_1);}
	        if global.lvl = 1{room_goto(A2600_2);}
	        if global.lvl = 2{room_goto(A2600_3);}
	        if global.lvl = 3{room_goto(A2600_4);}
	        if global.lvl = 4{room_goto(A2600_5);}
	        if global.lvl = 5{room_goto(A2600_6);}
	        if global.lvl = 6{room_goto(A2600_7);}
	        if global.lvl = 7{room_goto(A2600_4);}
	        if global.lvl = 8{room_goto(A2600_5);}
	        if global.lvl = 9{room_goto(A2600_6);}
	    }
	    if global.mode = 4{
	        if global.lvl = 0{room_goto(Bleach1);}
	        if global.lvl = 1{room_goto(Bleach2);}
	        if global.lvl = 2{room_goto(Bleach3);}
	        if global.lvl = 3{room_goto(Bleach4);}
	        if global.lvl = 4{room_goto(Bleach5);}
	        if global.lvl = 5{room_goto(Bleach6);}
	        if global.lvl = 6{room_goto(Bleach7);}
	        if global.lvl = 7{room_goto(Bleach4);}
	        if global.lvl = 8{room_goto(Bleach5);}
	        if global.lvl = 9{room_goto(Bleach6);}
	    }
	}
	if global.game = 0{
	    if global.mode = 0{room_goto(PacMan)}
	    if global.mode = 1{
	        if global.lvl < 2 or global.lvl & 1 = 1{room_goto(HanglyMan1)}
	        else{room_goto(HanglyMan2)}
	    }
	    if global.mode = 2{
	    if global.lvl = 0{global.babylvl = 0; global.babyloop = 0;}
	    if global.lvl = 1{global.babylvl = 1; global.babyloop = 0;}
	    if global.lvl = 2{global.babylvl = 2; global.babyloop = 0;}
	    if global.lvl = 4{global.babylvl = 1; global.babyloop = 1;}
	    if global.lvl = 6{global.babylvl = 0; global.babyloop = 0;}
	    if global.lvl = 8{global.babylvl = 2; global.babyloop = 0;}
	    if global.lvl = 12{global.babylvl = 1; global.babyloop = 1;}
	    if global.lvl = 14{global.babylvl = 0; global.babyloop = 0;}
	    global.babylvl = global.babylvl + 1; 
	    if global.babylvl = 4{global.babylvl = 1; global.babyloop = global.babyloop + 1; if global.babyloop = 2{global.babyloop = 0}}
	    if global.babylvl = 1{room_goto(Baby1)}
	    if global.babylvl = 2{room_goto(Baby2)}
	    if global.babylvl = 3{room_goto(Baby3)}
	    }
	    if global.mode = 3{
	        if room = rm_Menu{global.loopcount = global.lvl + 1}else{
	        if room = rm_Title{global.loopcount = 1}else{global.loopcount = global.loopcount + 1}}
	        if global.loopcount = 17{global.loopcount = 1}
	        if global.loopcount = 1{room_goto(PacMan)}
	        if global.loopcount = 2{room_goto(PacMan)}
	        if global.loopcount = 3{room_goto(Ultra2)}
	        if global.loopcount = 4{room_goto(Ultra2)}
	        if global.loopcount = 5{room_goto(Ultra2)}
	        if global.loopcount = 6{room_goto(Ultra3)}
	        if global.loopcount = 7{room_goto(Ultra3)}
	        if global.loopcount = 8{room_goto(Ultra3)}
	        if global.loopcount = 9{room_goto(Ultra4)}
	        if global.loopcount = 10{room_goto(Ultra4)}
	        if global.loopcount = 11{room_goto(Ultra4)}
	        if global.loopcount = 12{room_goto(Ultra5)}
	        if global.loopcount = 13{room_goto(Ultra5)}
	        if global.loopcount = 14{room_goto(Ultra6)}
	        if global.loopcount = 15{room_goto(Ultra6)}
	        if global.loopcount = 16{room_goto(Ultra6)} 
	    }
	    if global.mode = 4{
	        if global.lvl = 0 {room_goto(Arr_0_1)}
	        if global.lvl = 1 {room_goto(Arr_0_2)}
	        if global.lvl = 2 {room_goto(PacMan)}
	        if global.lvl = 3 {room_goto(Arr_1_2)}
	        if global.lvl = 4 {room_goto(Arr_2_1)}
	        if global.lvl = 5 {room_goto(Arr_2_2)}
	        if global.lvl = 6 {room_goto(Arr_3_1)}
	        if global.lvl = 7 {room_goto(Arr_3_2)}
	        if global.lvl = 8 {room_goto(Arr_4_1)}
	        if global.lvl = 9 {room_goto(Arr_4_2)}
	        if global.lvl = 10{room_goto(Arr_5_1)}
	        if global.lvl = 11{room_goto(Arr_5_2)}
	        if global.lvl = 12{room_goto(Arr_0_1)}
	        if global.lvl = 13{room_goto(Arr_0_2)}
	        if global.lvl = 14{room_goto(PacMan)}
	        if global.lvl = 15{room_goto(Arr_1_2)}
	        if global.lvl = 16{room_goto(Arr_2_1)}
	        if global.lvl = 17{room_goto(Arr_2_2)}
	        if global.lvl > 17{
	            if room = PacMan{room_goto(Arr_1_2)}else{
	        }}}
	    }
	if global.game = 1{
	    if global.mode = 0{
	    if global.lvl = 21{room_goto(MsPacMan3);global.loop = 0;}else{
	        if global.lvl > 21{
	            global.loopcount = global.loopcount + 1; if global.loopcount = 8{global.loopcount = 0; global.loop = global.loop + 1; if global.loop = 2{global.loop = 0}}
	            if global.loopcount < 4{room_goto(MsPacMan3);}
	            else{room_goto(MsPacMan4);}
	        }
	        else{
	            if global.lvl < 2{room_goto(MsPacMan1)}
	            if global.lvl > 1 and global.lvl < 5{room_goto(MsPacMan2)}
	            if global.lvl > 4 and global.lvl < 9{room_goto(MsPacMan3)}
	            if global.lvl > 8 and global.lvl < 13{room_goto(MsPacMan4)}
	            if global.lvl > 12 and global.lvl < 17{room_goto(MsPacMan3)}
	            if global.lvl > 16 and global.lvl < 22{room_goto(MsPacMan4)}
	        }
	    }}
	    if global.mode = 1{
	    if global.lvl = 21{room_goto(MsPMP3);global.loop = 0;}else{
	        if global.lvl > 21{
	            global.loopcount = global.loopcount + 1; if global.loopcount = 8{global.loopcount = 0; global.loop = global.loop + 1; if global.loop = 2{global.loop = 0}}
	            if global.loopcount < 4{room_goto(MsPMP3);}
	            else{room_goto(MsPMP4);}
	        }
	        else{
	            if global.lvl < 2{room_goto(MsPMP1)}
	            if global.lvl > 1 and global.lvl < 5{room_goto(MsPMP2)}
	            if global.lvl > 4 and global.lvl < 9{room_goto(MsPMP3)}
	            if global.lvl > 8 and global.lvl < 13{room_goto(MsPMP4)}
	            if global.lvl > 12 and global.lvl < 17{room_goto(MsPMP3)}
	            if global.lvl > 16 and global.lvl < 22{room_goto(MsPMP4)}
	        }
	    }}
	    if global.mode = 2{
	        if global.lvl = 19{room_goto(PacJr3);global.loop = 0;}else{
	        if global.lvl > 19{
	            global.loopcount = global.loopcount + 1; if global.loopcount = 4{global.loopcount = 0; global.loop = global.loop + 1; if global.loop = 2{global.loop = 0}}
	            if global.loopcount < 2{room_goto(PacJr3);}
	            else{room_goto(PacJr4);}
	        }
	        else{
	            if global.lvl < 2{room_goto(PacJr1)}
	            if global.lvl > 1 and global.lvl < 4{room_goto(PacJr2)}
	            if global.lvl > 3 and global.lvl < 7{room_goto(PacJr3)}
	            if global.lvl > 6 and global.lvl < 11{room_goto(PacJr4)}
	            if global.lvl > 10 and global.lvl < 15{room_goto(PacJr3)}
	            if global.lvl > 14 and global.lvl < 19{room_goto(PacJr4)}
	        }
	    }}
	    if global.mode = 3{
	        if global.lvl = -49 +49{room_goto(Strange1)}
	        if global.lvl = -49 +50{room_goto(Strange2)}
	        if global.lvl = -49 +51{room_goto(Strange3)}
	        if global.lvl = -49 +52{room_goto(Strange4)}
	        if global.lvl = -49 +53{room_goto(Strange5)}
	        if global.lvl = -49 +54{room_goto(Strange6)}
	        if global.lvl = -49 +55{room_goto(Strange7)}
	        if global.lvl = -49 +56{room_goto(Strange8)}
	        if global.lvl = -49 +57{room_goto(Strange9)}
	        if global.lvl = -49 +58{room_goto(Strange10Big)}
	        if global.lvl = -49 +59{room_goto(Strange11)}
	        if global.lvl = -49 +60{room_goto(Strange12)}
	        if global.lvl = -49 +61{room_goto(Strange13Small)}
	        if global.lvl = -49 +62{room_goto(Strange14Big)}
	        if global.lvl = -49 +63{room_goto(Strange15)}
	        if global.lvl = -49 +64{room_goto(Strange16Small)}
	        if global.lvl = -49 +65{room_goto(Strange17Big)}
	        if global.lvl = -49 +66{room_goto(Strange18)}
	        if global.lvl = -49 +67{room_goto(Strange19Big)}
	        if global.lvl = -49 +68{room_goto(Strange20Big)}
	        if global.lvl = -49 +69{room_goto(Strange21Big)}
	        if global.lvl = -49 +70{room_goto(Strange22Big)}
	        if global.lvl = -49 +71{room_goto(Strange23Big)}
	        if global.lvl = -49 +72{room_goto(Strange24Small)}
	        if global.lvl = -49 +73{room_goto(Strange25Big)}
	        if global.lvl = -49 +74{room_goto(Strange26Big)}
	        if global.lvl = -49 +75{room_goto(Strange27)}
	        if global.lvl = -49 +76{room_goto(Strange28Small)}
	        if global.lvl = -49 +77{room_goto(Strange29Small)}
	        if global.lvl = -49 +78{room_goto(Strange30Small)}
	        if global.lvl = -49 +79{room_goto(Strange31Big)}
	        if global.lvl = -49 +80{room_goto(Strange32)}
	        if global.lvl > 31{
	        if room = Strange32{room_goto(Strange1)}
	        else{room_goto_next()}
	        }
	    }
	    if global.mode = 4{
	        if global.lvl = 0{room_goto(Champ1)}
	        if global.lvl = 1{room_goto(Champ2)}
	        if global.lvl = 2{room_goto(Champ3)}
	        if global.lvl = 3{room_goto(Champ4)}
	        if global.lvl = 4{room_goto(Champ5)}
	        if global.lvl = 5{room_goto(Champ6)}
	        if global.lvl = 6{room_goto(Champ7)}
	        if global.lvl = 7{room_goto(Champ8)}
	        if global.lvl = 8{room_goto(Champ9)}
	        if global.lvl = 9{room_goto(Champ1)}
	        if global.lvl = 10{room_goto(Champ2)}
	        if global.lvl = 11{room_goto(Champ3)}
	        if global.lvl = 12{room_goto(Champ4)}
	        if global.lvl = 13{room_goto(Champ5)}
	        if global.lvl = 14{room_goto(Champ6)}
	        if global.lvl = 15{room_goto(Champ7)}
	        if global.lvl = 16{room_goto(Champ8)}
	        if global.lvl = 17{room_goto(Champ9)}
	        if global.lvl > 17{if room = Champ9{room_goto(Champ1)}; else{room_goto_next()}}
	    }
	}
	
}


