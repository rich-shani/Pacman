/// ===============================================================================
/// FRUIT OBJECT - STEP_1 EVENT (BOUNCE ANIMATION & PATHFINDING)
/// ===============================================================================
/// Purpose: Handle fruit bounce animation and pathfinding logic
/// Called: Every frame (second step event)
///
/// Responsibilities:
/// 1. Update bounce animation for stationary fruit (Ms. Pacman)
/// 2. Calculate target position for moving fruit (chase logic)
/// 3. Handle pathfinding and direction changes
/// 4. Update animation frame counter
/// ===============================================================================

// ===== BOUNCE ANIMATION =====
/// Create vertical bouncing effect for stationary fruit
/// Only active when fruit is visible and game is active
if (state > -1 && Pac.chomp == 0 && Pac.dead == 0 && 
    Pac.finish == 0 && global.start == 0) {
    
    /// Bounce upward
    if (up == 1) {
        /// Increment bounce offset based on game variant
        if (bounce < 2) {
            if (global.game == 1) {
                bounce = bounce + (3 / 4);  // Ms. Pacman bounce speed
            }
            if (global.game == 2) {
                bounce = bounce + (1 / 3);  // Jr. Pacman bounce speed
            }
        } else {
            /// Reached maximum bounce, start descending
            up = 0;
            bounce = 2;
            
            /// Play bounce sound effect (if level > 0)
            if (global.lvl > 0) {
                sound_play(Bump);
            }
        }
    }
    
    /// Bounce downward
    if (up == 0) {
        /// Decrement bounce offset
        if (bounce > -2) {
            if (global.game == 1) {
                bounce = bounce - (1 / 2);  // Ms. Pacman descent speed
            }
            if (global.game == 2) {
                bounce = bounce - (1 / 3);  // Jr. Pacman descent speed
            }
        } else {
            /// Reached minimum bounce, start ascending
            up = 1;
        }
    }
}

// ===== ANIMATION FRAME COUNTER =====
/// Increment animation frame counter (cycles every 16 frames)
im = im + 1;
if (im == 16) {
    im = 0;
}

// ===== TARGET CALCULATION (MS. PACMAN MODE) =====
/// Calculate target position for fruit to chase (Ms. Pacman mode only)
/// Fruit moves toward power pellets or player positions
if (state > -1) {
    /// Only calculate target in non-standard rooms
    if (room_width == 448) {
        // Standard Pacman - no target calculation needed
    } else {
        /// Check if target is a power pellet
        if (!collision_point(chasex, chasey, Power, false, true)) {
            /// If power pellets exist, calculate new target
            if (instance_number(Power) == 0) {
                // No power pellets - no target
            } else {
                /// Randomly choose between player 1 and player 2
                if (irandom(2) == 1) {
                    chasex = global.p1x;
                    chasey = global.p1y;
                } else {
                    /// Randomly choose player 2 or mirror position
                    if (irandom(1) == 1) {
                        chasex = global.p2x;
                        chasey = global.p2y;
                    } else {
                        /// Check if mirror positions are safe (no power pellets)
                        if (!collision_point(global.p1x, global.p1y, Power, false, true) &&
                            !collision_point((room_width - 16) - global.p1x, global.p1y, Power, false, true) &&
                            !collision_point(global.p2x, global.p2y, Power, false, true) &&
                            !collision_point((room_width - 16) - global.p2x, global.p2y, Power, false, true)) {
                            /// Use mirror position (p3)
                            chasex = global.p3x;
                            chasey = global.p3y;
                        } else {
                            /// Fallback to random player position
                            if (irandom(1) == 1) {
                                chasex = global.p1x;
                                chasey = global.p1y;
                            } else {
                                chasex = global.p2x;
                                chasey = global.p2y;
                            }
                        }
                    }
                }
                
                /// Randomly mirror target horizontally (50% chance)
                if (irandom(1) == 1) {
                    chasex = (room_width - 16) - chasex;
                }
            }
        }
    }
}

// ===== PATHFINDING LOGIC =====
/// Handle pathfinding and direction changes for moving fruit
/// Only active when level is not finished
if (Pac.finish == 0) {
    if (state > -1) {
        /// Only process pathfinding when not in chomp state
        if (Pac.chomp == 0) {
            codir = 0;  // Reset collision direction
            
            /// Only process pathfinding in valid vertical bounds
            if (y > 48 && y < room_height - 48) {
                /// Check if fruit has reached a new tile
                if (newtile == 0) {
                    /// Check if fruit is aligned with tile grid
                    if (tilex == (16 * (round(x / 16))) && 
                        tiley == (16 * (round(y / 16)))) {
                        // Still on same tile - no action needed
                    } else {
                        /// Fruit has moved to a new tile
                        newtile = 1;
                        tilex = (16 * (round(x / 16)));
                        tiley = (16 * (round(y / 16)));
                        
                        // ===== SPAWNING STATE (state = 0) =====
                        /// Initial pathfinding when fruit first spawns
                        if (state == 0) {
                            if (room_width == 448) {
                                /// Standard Pacman - move to center position
                                if (room == Strange4) {
                                    /// Special room handling
                                    script_execute(chase_object, tilex, tiley, 192, 512);
                                } else {
                                    /// Move toward center of fruit area
                                    if (tiley == (Blinky.ystart - 224) + 224 && 
                                        tilex > 144 - 1 && tilex < 288) {
                                        script_execute(chase_object, tilex, tiley, 288, 
                                                      (Blinky.ystart - 224) + 224);
                                    } else {
                                        if (tilex == 288 && 
                                            tiley > (Blinky.ystart - 224) + 224 - 1 && 
                                            tiley < (Blinky.ystart - 224) + 320) {
                                            script_execute(chase_object, tilex, tiley, 288, 
                                                          (Blinky.ystart - 224) + 320);
                                        } else {
                                            if (tiley == (Blinky.ystart - 224) + 320 && 
                                                tilex > 144 && tilex < 288 + 1) {
                                                script_execute(chase_object, tilex, tiley, 144, 
                                                              (Blinky.ystart - 224) + 320);
                                            } else {
                                                if (tilex == 144 && 
                                                    tiley > (Blinky.ystart - 224) + 224 && 
                                                    tiley < (Blinky.ystart - 224) + 320 + 1) {
                                                    script_execute(chase_object, tilex, tiley, 144, 
                                                                  (Blinky.ystart - 224) + 224);
                                                } else {
                                                    /// Default: move to center
                                                    script_execute(chase_object, tilex, tiley, 216, 
                                                                  (Blinky.ystart - 224) + 272);
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                /// Non-standard rooms - use random direction
                                script_execute(random_direction);
                            }
                        }
                        
                        // ===== MOVING STATE (state = 1) =====
                        /// Pathfinding during active movement
                        if (state == 1) {
                            /// Check for direction markers at intersections
                            /// These markers guide fruit through the maze
                            if (tilex == c1x && tiley == c1y && 
                                !c1dir == dir + 2 && !c1dir == dir - 2) {
                                dir = c1dir;
                            } else {
                                if (tilex == c2x && tiley == c2y && 
                                    !c2dir == dir + 2 && !c2dir == dir - 2) {
                                    dir = c2dir;
                                } else {
                                    if (tilex == c3x && tiley == c3y && 
                                        !c3dir == dir + 2 && !c3dir == dir - 2) {
                                        dir = c3dir;
                                    } else {
                                        if (tilex == c4x && tiley == c4y && 
                                            !c4dir == dir + 2 && !c4dir == dir - 2) {
                                            dir = c4dir;
                                        } else {
                                            if (tilex == c5x && tiley == c5y && 
                                                !c5dir == dir + 2 && !c5dir == dir - 2) {
                                                dir = c5dir;
                                            } else {
                                                if (tilex == c6x && tiley == c6y && 
                                                    !c6dir == dir + 2 && !c6dir == dir - 2) {
                                                    dir = c6dir;
                                                } else {
                                                    if (tilex == c7x && tiley == c7y && 
                                                        !c7dir == dir + 2 && !c7dir == dir - 2) {
                                                        dir = c7dir;
                                                    } else {
                                                        if (tilex == c8x && tiley == c8y && 
                                                            !c8dir == dir + 2 && !c8dir == dir - 2) {
                                                            dir = c8dir;
                                                        } else {
                                                            /// No direction marker found - calculate new direction
                                                            script_execute(codir_script);
                                                            
                                                            if (room_width == 448) {
                                                                /// Standard room pathfinding
                                                                if (room == JoyMan) {
                                                                    /// Special room handling
                                                                    if (exopt < 2) {
                                                                        script_execute(chase_object, tilex, tiley, 80, 272);
                                                                        exit;
                                                                    } else {
                                                                        script_execute(chase_object, tilex, tiley, 352, 272);
                                                                        exit;
                                                                    }
                                                                }
                                                                
                                                                /// Choose exit based on exopt value
                                                                if (exopt == 0) {
                                                                    if (room == Strange3) {
                                                                        script_execute(chase_object, tilex, tiley, -320, 208);
                                                                    } else {
                                                                        if (room == Champ1) {
                                                                            script_execute(chase_object, tilex, tiley, 176, 32);
                                                                        } else {
                                                                            script_execute(chase_object, tilex, tiley, 0, global.ex1);
                                                                        }
                                                                    }
                                                                }
                                                                
                                                                if (exopt == 1) {
                                                                    if (room == Strange3) {
                                                                        script_execute(chase_object, tilex, tiley, 0, 304);
                                                                    } else {
                                                                        if (room == Champ1) {
                                                                            script_execute(chase_object, tilex, tiley, 0, 352);
                                                                        } else {
                                                                            script_execute(chase_object, tilex, tiley, 0, global.ex2);
                                                                        }
                                                                    }
                                                                }
                                                                
                                                                if (exopt == 2) {
                                                                    if (room == Strange3) {
                                                                        script_execute(chase_object, tilex, tiley, 432 + 320, 208);
                                                                    } else {
                                                                        if (room == Champ1) {
                                                                            script_execute(chase_object, tilex, tiley, 256, 32);
                                                                        } else {
                                                                            script_execute(chase_object, tilex, tiley, 432, global.ex1);
                                                                        }
                                                                    }
                                                                }
                                                                
                                                                if (exopt == 3) {
                                                                    if (room == Strange3) {
                                                                        script_execute(chase_object, tilex, tiley, 432, 304);
                                                                    } else {
                                                                        if (room == Champ1) {
                                                                            script_execute(chase_object, tilex, tiley, 432, 352);
                                                                        } else {
                                                                            script_execute(chase_object, tilex, tiley, 432, global.ex2);
                                                                        }
                                                                    }
                                                                }
                                                            } else {
                                                                /// Extended room pathfinding
                                                                if (instance_number(Power) == 0) {
                                                                    /// No power pellets - use random direction
                                                                    script_execute(random_direction);
                                                                } else {
                                                                    /// Chase calculated target position
                                                                    script_execute(chase_object, tilex, tiley, chasex, chasey);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
