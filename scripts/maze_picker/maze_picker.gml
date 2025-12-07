function maze_picker() {
	if global.game < 2 {
		global.randchoose = irandom(4) + 1;
		if global.randchoose = 1 { room_goto(PacMan) }
		if global.randchoose = 2 { room_goto(MsPacMan1) }
		if global.randchoose = 3 { room_goto(MsPacMan2) }
		if global.randchoose = 4 { room_goto(MsPacMan3) }
		if global.randchoose = 5 { room_goto(MsPacMan4) }
	}
}
