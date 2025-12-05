function random_direction() {
	if x>8 and x<(room_width-8){ ///Thank you Retro Game Mechanics Explained for turn probabilities! (5/29/23)
	check = 0;
	if direction = 0{ ///moving right
	    if !collision_point(tilex+16,tiley,Wall,false,true) and !collision_point(tilex+16,tiley,HanglyWall,false,true){check = check + 1} ///empty right
	    if !collision_point(tilex,tiley-16,Wall,false,true) and !collision_point(tilex,tiley-16,HanglyWall,false,true){check = check + 3} ///empty up
	    if !collision_point(tilex,tiley+16,Wall,false,true) and !collision_point(tilex,tiley+16,HanglyWall,false,true){check = check + 5} ///empty down
	        if check = 1{dir = 0;} ///right alone
	        if check = 3{dir = 1;} ///up alone
	        if check = 5{dir = 3;} ///down alone
	        if check = 4{ ///right and up
	            if random(1) < .252{dir = 0};else{dir = 1};
	        }
	        if check = 6{ ///right and down
	            if random(1) < .285{dir = 3};else{dir = 0};
	        }
	        if check = 8{ ///up and down
	            if random(1) < .463{dir = 1};else{dir = 3};
	        }
	        if check = 9{ ///right, up, and down
	            if random(1) < .252{dir = 0};else{if random(1) < .381{dir = 3};else{dir = 1};}
	        }
	exit
	}
	if direction = 90{ /// moving up
	    if !collision_point(tilex+16,tiley,Wall,false,true) and !collision_point(tilex+16,tiley,HanglyWall,false,true){check = check + 1} ///empty right
	    if !collision_point(tilex,tiley-16,Wall,false,true) and !collision_point(tilex,tiley-16,HanglyWall,false,true){check = check + 3} ///empty up
	    if !collision_point(tilex-16,tiley,Wall,false,true) and !collision_point(tilex-16,tiley,HanglyWall,false,true){check = check + 5} ///empty left
	        if check = 1{dir = 0;} ///right alone
	        if check = 3{dir = 1;} ///up alone
	        if check = 5{dir = 2;} ///left alone
	        if check = 4{ ///right and up
	            if random(1) < .252{dir = 0};else{dir = 1};
	        }
	        if check = 6{ ///right and left
	            if random(1) < .415{dir = 0};else{dir = 2};
	        }
	        if check = 8{ ///up and left
	            if random(1) < .163{dir = 1};else{dir = 2};
	        }
	        if check = 9{ ///right, up, and left
	            if random(1) < .163{dir = 1};else{if random(1) < .301{dir = 0};else{dir = 2};}
	        }
	exit
	}
	if direction = 180{ ///moving left
	    if !collision_point(tilex-16,tiley,Wall,false,true) and !collision_point(tilex-16,tiley,HanglyWall,false,true){check = check + 1} ///empty left
	    if !collision_point(tilex,tiley-16,Wall,false,true) and !collision_point(tilex,tiley-16,HanglyWall,false,true){check = check + 3} ///empty up
	    if !collision_point(tilex,tiley+16,Wall,false,true) and !collision_point(tilex,tiley+16,HanglyWall,false,true){check = check + 5} ///empty down
	        if check = 1{dir = 2;} ///left alone
	        if check = 3{dir = 1;} ///up alone
	        if check = 5{dir = 3;} ///down alone
	        if check = 4{ ///left and up
	            if random(1) < .163{dir = 1};else{dir = 2};
	        }
	        if check = 6{ ///left and down
	            if random(1) < .300{dir = 2};else{dir = 3};
	        }
	        if check = 8{ ///up and down
	            if random(1) < .463{dir = 1};else{dir = 3};
	        }
	        if check = 9{ ///left, up, and down
	            if random(1) < .163{dir = 1};else{if random(1) < .358{dir = 2};else{dir = 3};}
	        }
	exit
	}
	if direction = 270{ ///moving down
	    if !collision_point(tilex+16,tiley,Wall,false,true) and !collision_point(tilex+16,tiley,HanglyWall,false,true){check = check + 1} ///empty right
	    if !collision_point(tilex,tiley+16,Wall,false,true) and !collision_point(tilex,tiley+16,HanglyWall,false,true){check = check + 3} ///empty down
	    if !collision_point(tilex-16,tiley,Wall,false,true) and !collision_point(tilex-16,tiley,HanglyWall,false,true){check = check + 5} ///empty left
	        if check = 1{dir = 0;} ///right alone
	        if check = 3{dir = 3;} ///down alone
	        if check = 5{dir = 2;} ///left alone
	        if check = 4{ ///right and down
	            if random(1) < .285{dir = 3};else{dir = 0};
	        }
	        if check = 6{ ///right and left
	            if random(1) < .415{dir = 0};else{dir = 2};
	        }
	        if check = 8{ ///down and left
	            if random(1) < .300{dir = 2};else{dir = 3};
	        }
	        if check = 9{ ///right, down, and left
	            if random(1) < .285{dir = 3};else{if random(1) < .412{dir = 2};else{dir = 0};}
	        }
	exit
	}
	}



}
