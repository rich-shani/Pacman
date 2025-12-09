/// ===============================================================================
/// draw2() - PLAYER 2 SPRITE RENDERING
/// ===============================================================================
/// Purpose: Draw Player 2 (Mac) sprite with appropriate animation and state
/// Called: From Mac object Draw event
/// Parameters:
///   - argument0: X position to draw sprite
///   - argument1: Y position to draw sprite
///
/// Responsibilities:
/// 1. Draw death animation when Player 2 dies
/// 2. Draw normal sprite with animation based on direction
/// 3. Draw ghost eating animation
/// 4. Handle boost mode visual effects
/// 5. Handle prohibited state (invisible)
/// ===============================================================================

function draw2(argument0, argument1) {
    /// Only draw when alarm[9] is finished (level start delay complete)
    if (alarm[9] == -1) {
        // ===== DEATH ANIMATION =====
        /// Draw death animation when Player 2 is dead
        if (dead > 1) {
            if (deader == 2) {
                // ===== STANDARD ROOM (448 width) =====
                if (room_width == 448) {
                    /// Choose sprite based on game variant
                    if (global.ex1 == 0) {
                        /// Standard Pacman death sprite
                        draw_sprite(spr_Dead2, floor(deadani2m), argument0, argument1);
                    } else {
                        /// Ms. Pacman or Otto death sprite
                        if (global.otto == 0) {
                            draw_sprite(spr_MsDead2, floor(deadani2m), argument0, argument1);
                        } else {
                            draw_sprite(spr_OttoDead2, floor(deadani2m), argument0, argument1);
                        }
                    }
                }
                // ===== EXTENDED ROOM (other sizes) =====
                else {
                    /// Jr. Pacman death sprite (only if not final death)
                    if (dead < 3) {
                        draw_sprite(spr_JrDead2, floor(deadani2m), round(argument0), round(argument1));
                    }
                }
            }
        }
        // ===== NORMAL SPRITE RENDERING =====
        else {
            // ===== PROHIBITED STATE (INVISIBLE) =====
            /// Draw invisible sprite when Player 2 is prohibited from ghost interaction
            if (Pac.prohibit == 2) {
                if (room_width == 448) {
                    /// Standard Pacman invisible sprite
                    if (global.ex1 == 0) {
                        draw_sprite_ext(spr_Man2, 16, argument0, argument1, 1, 1, 0, c_white, 1);
                    } else {
                        /// Ms. Pacman or Otto invisible sprite
                        if (global.otto == 0) {
                            draw_sprite_ext(spr_MsMan2, 16, argument0, argument1, 1, 1, 0, c_white, 1);
                        } else {
                            draw_sprite_ext(spr_OttoMan2, 16, argument0, argument1, 1, 1, 0, c_white, 1);
                        }
                    }
                } else {
                    /// Jr. Pacman invisible sprite
                    draw_sprite_ext(spr_JrMan2, 16, round(argument0), round(argument1), 1, 1, 0, c_white, 1);
                }
            }
            // ===== NORMAL STATE =====
            else {
                // ===== NOT EATING GHOST =====
                /// Draw normal sprite with animation
                if (chomp == 0 || chomper == 1) {
                    /// Only animate when game has started
                    if (global.start == false) {
                        // ===== BOOST MODE VISUAL EFFECTS =====
                        /// Draw boost lines when boost mode is active
                        if (global.boost > 0) {
                            /// Otto mode has special boost line sprites
                            if (global.otto == 1) {
                                if (dir2 == 1) {
                                    /// Up direction - use special sprite 5
                                    draw_sprite_ext(spr_boostlines, 5, argument0, argument1, 1, 1, 0, c_lime, 1);
                                } else {
                                    if (dir2 == 3) {
                                        /// Down direction - use special sprite 6
                                        draw_sprite_ext(spr_boostlines, 6, argument0, argument1, 1, 1, 0, c_lime, 1);
                                    } else {
                                        /// Other directions - use direction as sprite index
                                        draw_sprite_ext(spr_boostlines, dir2, argument0, argument1, 1, 1, 0, c_lime, 1);
                                    }
                                }
                            } else {
                                /// Standard boost lines
                                if (global.game == 2 && dir2 == 1) {
                                    /// Jr. Pacman up direction - use special sprite 4
                                    draw_sprite_ext(spr_boostlines, 4, argument0, argument1, 1, 1, 0, c_lime, 1);
                                } else {
                                    /// Standard boost lines - use direction as sprite index
                                    draw_sprite_ext(spr_boostlines, dir2, argument0, argument1, 1, 1, 0, c_lime, 1);
                                }
                            }
                        }
                        
                        // ===== STANDARD ROOM SPRITE =====
                        if (room_width == 448) {
                            /// Calculate sprite frame: (i2m/2) for animation speed, (4*dir2) for direction
                            if (global.ex1 == 0) {
                                /// Standard Pacman sprite
                                draw_sprite_ext(spr_Man2, (floor(i2m / 2)) + (4 * dir2), 
                                              argument0, argument1, 1, 1, 0, c_white, 1);
                            } else {
                                /// Ms. Pacman or Otto sprite
                                if (global.otto == 0) {
                                    draw_sprite_ext(spr_MsMan2, (floor(i2m / 2)) + (4 * dir2), 
                                                  argument0, argument1, 1, 1, 0, c_white, 1);
                                } else {
                                    draw_sprite_ext(spr_OttoMan2, (floor(i2m / 2)) + (4 * dir2), 
                                                  argument0, argument1, 1, 1, 0, c_white, 1);
                                }
                            }
                        }
                        // ===== EXTENDED ROOM SPRITE =====
                        else {
                            /// Jr. Pacman sprite
                            draw_sprite_ext(spr_JrMan2, (floor(i2m / 2)) + (4 * dir2), 
                                          round(argument0), round(argument1), 1, 1, 0, c_white, 1);
                        }
                    }
                    // ===== LEVEL START STATE =====
                    /// Draw static sprite during level start
                    else {
                        if (room_width == 448) {
                            if (global.ex1 == 0) {
                                /// Standard Pacman - closed mouth
                                draw_sprite_ext(spr_Man2, 0, argument0, argument1, 1, 1, 0, c_white, 1);
                            } else {
                                if (global.otto == 0) {
                                    /// Ms. Pacman - slightly open mouth
                                    draw_sprite_ext(spr_MsMan2, 1, argument0, argument1, 1, 1, 0, c_white, 1);
                                } else {
                                    /// Otto - closed mouth
                                    draw_sprite_ext(spr_OttoMan2, 0, argument0, argument1, 1, 1, 0, c_white, 1);
                                }
                            }
                        } else {
                            /// Jr. Pacman - slightly open mouth
                            draw_sprite_ext(spr_JrMan2, 1, round(argument0), round(argument1), 1, 1, 0, c_white, 1);
                        }
                    }
                }
                // ===== EATING GHOST ANIMATION =====
                /// Draw ghost eating animation
                else {
                    /// Choose color based on plus mode
                    if (global.plus == 0) {
                        /// Normal mode - cyan color
                        draw_sprite_ext(spr_Chomp, chompcount - 1 + Pac.pluseat, 
                                      round(argument0) - (8 * (scale - 1)), 
                                      round(argument1) - (8 * (scale - 1)), 
                                      scale, scale, 0, make_color_rgb(0, 255, 255), 1);
                    } else {
                        /// Plus mode - yellow color
                        draw_sprite_ext(spr_Chomp, chompcount - 1 + Pac.pluseat, 
                                      round(argument0) - (8 * (scale - 1)), 
                                      round(argument1) - (8 * (scale - 1)), 
                                      scale, scale, 0, make_color_rgb(255, 255, 0), 1);
                    }
                }
            }
        }
    }
}
