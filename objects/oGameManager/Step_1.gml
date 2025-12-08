// ===== AUDIO & AMBIENCE MANAGEMENT =====
/// Control background music based on game state
if (global.lvl > 0) {

    /// Stop all ambience when not playing
    if (Pac.dead > PAC_STATE.ALIVE || finish > 0 || start == 1) {
        sound_stop(Ghost1);
        sound_stop(Ghost2);
        sound_stop(Ghost3);
        sound_stop(Ghost4);
        sound_stop(Ghost5);
        sound_stop(Blue);
        sound_stop(Flee);

        sound_stop(MsGhost1);
        sound_stop(MsGhost2);
        sound_stop(MsGhost3);
        sound_stop(MsGhost4);
        sound_stop(MsGhost5);
        sound_stop(MsBlue);
        sound_stop(MsFlee);

        sound_stop(JrGhost1);
        sound_stop(JrGhost2);
        sound_stop(JrGhost3);
        sound_stop(JrGhost4);
        sound_stop(JrGhost5);
        sound_stop(JrBlue);
        sound_stop(JrFlee);
    }

    /// Only manage ambience during active gameplay
    if (Pac.dead == PAC_STATE.ALIVE && finish == 0 && start == 0) {

        /// ===== SIREN PROGRESSION =====
        /// Update siren level based on remaining dot count
        /// Different thresholds for different level sizes
        if (room_width == 448) {
            /// Small level (classic Pacman)
            if (siren == 0 && dotcount > 111) {
                siren = 1;
            }
            if (siren == 1 && dotcount > 179) {
                siren = 2;
            }
            if (siren == 2 && dotcount > 211) {
                siren = 3;
            }
            if (siren == 3 && dotcount > 227) {
                siren = 4;
            }
        }
        else {
            /// Large level
            if (siren == 0 && dotcount > 229) {
                siren = 1;
            }
            if (siren == 1 && dotcount > 357) {
                siren = 2;
            }
            if (siren == 2 && dotcount > 421) {
                siren = 3;
            }
            if (siren == 3 && dotcount > 453) {
                siren = 4;
            }
        }

        /// ===== AUDIO PLAYBACK =====
        /// Select appropriate music based on game state and game variant
        if (global.game == 0) {
            /// STANDARD PACMAN SOUNDS

            /// Check if any ghost is in flee (frightened) mode
            if (Blinky.state == GHOST_STATE.EYES || Pinky.state == GHOST_STATE.EYES ||
                Inky.state == GHOST_STATE.EYES || Clyde.state == GHOST_STATE.EYES) {

                if (ambience != 6) {
                    sound_loop(Flee);
                    ambience = 6;
                    exit;
                }
            }
            else {
                /// Check fright mode
                if (fright == PAC_FRIGHT.ACTIVE) {
                    if (ambience != 5) {
                        sound_loop(Blue);
                        ambience = 5;
                        exit;
                    }
                }
                else {
                    /// Play siren based on dot progression
                    if (siren == 4) {
                        if (ambience != SIREN_LEVEL.LEVEL_4) {
                            sound_loop(Ghost5);
                            ambience = SIREN_LEVEL.LEVEL_4;
                            exit;
                        }
                    }
                    else if (siren == 3) {
                        if (ambience != SIREN_LEVEL.LEVEL_3) {
                            sound_loop(Ghost4);
                            ambience = SIREN_LEVEL.LEVEL_3;
                            exit;
                        }
                    }
                    else if (siren == 2) {
                        if (ambience != SIREN_LEVEL.LEVEL_2) {
                            sound_loop(Ghost3);
                            ambience = SIREN_LEVEL.LEVEL_2;
                            exit;
                        }
                    }
                    else if (siren == 1) {
                        if (ambience != SIREN_LEVEL.LEVEL_1) {
                            sound_loop(Ghost2);
                            ambience = SIREN_LEVEL.LEVEL_1;
                            exit;
                        }
                    }
                    else {
                        if (ambience != SIREN_LEVEL.LEVEL_0) {
                            sound_loop(Ghost1);
                            ambience = SIREN_LEVEL.LEVEL_0;
                            exit;
                        }
                    }
                }
            }
        }

        if (global.game == 1) {
            /// MS. PACMAN SOUNDS

            if (global.otto == 0 && (Blinky.state == GHOST_STATE.EYES || Pinky.state == GHOST_STATE.EYES ||
                Inky.state == GHOST_STATE.EYES || Clyde.state == GHOST_STATE.EYES)) {

                if (ambience != 6) {
                    sound_loop(MsFlee);
                    ambience = 6;
                    exit;
                }
            }
            else {
                if (fright == PAC_FRIGHT.ACTIVE) {
                    if (ambience != 5) {
                        sound_loop(MsBlue);
                        ambience = 5;
                        exit;
                    }
                }
                else {
                    if (siren == 4) {
                        if (ambience != SIREN_LEVEL.LEVEL_4) {
                            sound_loop(MsGhost5);
                            ambience = SIREN_LEVEL.LEVEL_4;
                            exit;
                        }
                    }
                    else if (siren == 3) {
                        if (ambience != SIREN_LEVEL.LEVEL_3) {
                            sound_loop(MsGhost4);
                            ambience = SIREN_LEVEL.LEVEL_3;
                            exit;
                        }
                    }
                    else if (siren == 2) {
                        if (ambience != SIREN_LEVEL.LEVEL_2) {
                            sound_loop(MsGhost3);
                            ambience = SIREN_LEVEL.LEVEL_2;
                            exit;
                        }
                    }
                    else if (siren == 1) {
                        if (ambience != SIREN_LEVEL.LEVEL_1) {
                            sound_loop(MsGhost2);
                            ambience = SIREN_LEVEL.LEVEL_1;
                            exit;
                        }
                    }
                    else {
                        if (ambience != SIREN_LEVEL.LEVEL_0) {
                            sound_loop(MsGhost1);
                            ambience = SIREN_LEVEL.LEVEL_0;
                            exit;
                        }
                    }
                }
            }
        }

        if (global.game == 2) {
            /// JR. PACMAN SOUNDS

            if (Blinky.state == GHOST_STATE.EYES || Pinky.state == GHOST_STATE.EYES ||
                Inky.state == GHOST_STATE.EYES || Clyde.state == GHOST_STATE.EYES) {

                if (ambience != 6) {
                    sound_loop(JrFlee);
                    ambience = 6;
                    exit;
                }
            }
            else {
                if (fright == PAC_FRIGHT.ACTIVE) {
                    if (ambience != 5) {
                        sound_loop(JrBlue);
                        ambience = 5;
                        exit;
                    }
                }
                else {
                    if (siren == 4) {
                        if (ambience != SIREN_LEVEL.LEVEL_4) {
                            sound_loop(JrGhost5);
                            ambience = SIREN_LEVEL.LEVEL_4;
                            exit;
                        }
                    }
                    else if (siren == 3) {
                        if (ambience != SIREN_LEVEL.LEVEL_3) {
                            sound_loop(JrGhost4);
                            ambience = SIREN_LEVEL.LEVEL_3;
                            exit;
                        }
                    }
                    else if (siren == 2) {
                        if (ambience != SIREN_LEVEL.LEVEL_2) {
                            sound_loop(JrGhost3);
                            ambience = SIREN_LEVEL.LEVEL_2;
                            exit;
                        }
                    }
                    else if (siren == 1) {
                        if (ambience != SIREN_LEVEL.LEVEL_1) {
                            sound_loop(JrGhost2);
                            ambience = SIREN_LEVEL.LEVEL_1;
                            exit;
                        }
                    }
                    else {
                        if (ambience != SIREN_LEVEL.LEVEL_0) {
                            sound_loop(JrGhost1);
                            ambience = SIREN_LEVEL.LEVEL_0;
                            exit;
                        }
                    }
                }
            }
        }
    }
}