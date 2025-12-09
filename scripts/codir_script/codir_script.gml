/// ===============================================================================
/// codir_script() - COLLISION DIRECTION SCRIPT FOR PATHFINDING
/// ===============================================================================
/// Purpose: Track closest points to target for pathfinding optimization
/// Called: From ghost and fruit pathfinding logic
/// Parameters:
///   - Uses global variables: tilex, tiley, exopt, chasex, chasey
///   - Modifies: codir, closex, closey, close2x, close2y, etc., c1x-c8x, c1y-c8y
///
/// Algorithm:
/// This script maintains a list of the 4 closest points to the target.
/// When the object reaches one of these close points, it sets codir=1 to
/// indicate a preferred direction should be taken.
///
/// The script:
/// 1. Determines target position based on exopt or chase coordinates
/// 2. Tracks the 4 closest points to target
/// 3. Stores direction markers at intersections (c1-c8)
/// 4. Updates close point list as object moves
/// ===============================================================================

function codir_script() {
    /// Only process when object is within valid horizontal bounds
    if (x > 15 && x < room_width - 15) {
        /// Initialize variables
        targx = 0;   // Target X coordinate
        targy = 0;   // Target Y coordinate
        codir = 0;   // Collision direction flag (0=no preferred, 1=preferred direction)
        
        /// Determine target position
        if (room_width == 448) {
            /// Standard room - use exit option to determine target
            /// exopt: 0=left-top, 1=left-bottom, 2=right-top, 3=right-bottom
            targx = (floor(exopt / 2) * 432);  // 0 or 432 based on exopt
            if (exopt == 0 || exopt == 2) {
                targy = global.ex1;  // Top exit
            }
            if (exopt == 1 || exopt == 3) {
                targy = global.ex2;  // Bottom exit
            }
        } else {
            /// Extended room - use chase coordinates
            targx = chasex;
            targy = chasey;
        }
        
        /// Check if object is at closest point
        if (tilex == closex && tiley == closey) {
            codir = 1;  // Set preferred direction flag
            
            /// Store direction marker at this intersection
            /// Markers help remember which way to turn at intersections
            if (c1x == 0) {
                c1x = closex;
                c1y = closey;
            } else {
                if (c2x == 0) {
                    c2x = closex;
                    c2y = closey;
                } else {
                    if (c3x == 0) {
                        c3x = closex;
                        c3y = closey;
                    } else {
                        if (c4x == 0) {
                            c4x = closex;
                            c4y = closey;
                        } else {
                            if (c5x == 0) {
                                c5x = closex;
                                c5y = closey;
                            } else {
                                if (c6x == 0) {
                                    c6x = closex;
                                    c6y = closey;
                                } else {
                                    if (c7x == 0) {
                                        c7x = closex;
                                        c7y = closey;
                                    } else {
                                        if (c8x == 0) {
                                            c8x = closex;
                                            c8y = closey;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            /// Shift close point list (move to next closest point)
            closex = close2x;
            closey = close2y;
            close2x = close3x;
            close2y = close3y;
            close3x = close4x;
            close3y = close4y;
            close4x = 1000;  // Reset to far position
            close4y = 1000;
        } else {
            /// Object is not at closest point - update close point list
            check = 0;  // Collision check counter
            
            /// Check for walls in each direction
            /// Each direction adds a unique weight to identify combinations
            if (collision_point(tilex + 16, tiley, Wall, false, true)) {
                check = check + 1;   // Right blocked
            }
            if (collision_point(tilex, tiley - 16, Wall, false, true)) {
                check = check + 3;   // Up blocked
            }
            if (collision_point(tilex - 16, tiley, Wall, false, true)) {
                check = check + 5;   // Left blocked
            }
            if (collision_point(tilex, tiley + 16, Wall, false, true)) {
                check = check + 11;  // Down blocked
            }
            
            /// Only update close points at intersections (not dead ends)
            /// Dead ends have check values: 0, 1, 3, 5, 11 (single direction or no walls)
            /// Intersections have check values: 4, 6, 8, 9, 12, 14, 16, 19 (multiple directions)
            if (check == 0 || check == 1 || check == 3 || check == 5 || check == 11) {
                /// Calculate Manhattan distance to target
                var _dist_to_target = abs(targx - tilex) + abs(targy - tiley);
                var _dist_to_close = abs(targx - closex) + abs(targy - closey);
                
                /// Check if current position is closer than closest point
                if (_dist_to_target < _dist_to_close) {
                    /// Avoid duplicate entries
                    if (tilex == closex && tiley == closey) {
                        // Already in list
                    } else {
                        if (tilex == close2x && tiley == close2y) {
                            // Already in list
                        } else {
                            if (tilex == close3x && tiley == close3y) {
                                // Already in list
                            } else {
                                if (tilex == close4x && tiley == close4y) {
                                    // Already in list
                                } else {
                                    /// Add to list and shift others
                                    close4x = close3x;
                                    close4y = close3y;
                                    close3x = close2x;
                                    close3y = close2y;
                                    close2x = closex;
                                    close2y = closey;
                                    closex = tilex;
                                    closey = tiley;
                                }
                            }
                        }
                    }
                } else {
                    /// Check if closer than second closest point
                    var _dist_to_close2 = abs(targx - close2x) + abs(targy - close2y);
                    if (_dist_to_target < _dist_to_close2) {
                        /// Avoid duplicate entries and direction markers
                        if (tilex == closex && tiley == closey) {
                            // Already in list
                        } else {
                            if (tilex == close2x && tiley == close2y) {
                                // Already in list
                            } else {
                                if (tilex == close3x && tiley == close3y) {
                                    // Already in list
                                } else {
                                    if (tilex == close4x && tiley == close4y) {
                                        // Already in list
                                    } else {
                                        /// Check against direction markers
                                        if (tilex == c1x && tiley == c1y) {
                                            // At marker
                                        } else {
                                            if (tilex == c2x && tiley == c2y) {
                                                // At marker
                                            } else {
                                                if (tilex == c3x && tiley == c3y) {
                                                    // At marker
                                                } else {
                                                    if (tilex == c4x && tiley == c4y) {
                                                        // At marker
                                                    } else {
                                                        if (tilex == c5x && tiley == c5y) {
                                                            // At marker
                                                        } else {
                                                            if (tilex == c6x && tiley == c6y) {
                                                                // At marker
                                                            } else {
                                                                if (tilex == c7x && tiley == c7y) {
                                                                    // At marker
                                                                } else {
                                                                    if (tilex == c8x && tiley == c8y) {
                                                                        // At marker
                                                                    } else {
                                                                        /// Add to second position
                                                                        close4x = close3x;
                                                                        close4y = close3y;
                                                                        close3x = close2x;
                                                                        close3y = close2y;
                                                                        close2x = tilex;
                                                                        close2y = tiley;
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
                    } else {
                        /// Check if closer than third closest point
                        var _dist_to_close3 = abs(targx - close3x) + abs(targy - close3y);
                        if (_dist_to_target < _dist_to_close3) {
                            /// Avoid duplicates and markers
                            if (tilex == closex && tiley == closey) {
                                // Already in list
                            } else {
                                if (tilex == close2x && tiley == close2y) {
                                    // Already in list
                                } else {
                                    if (tilex == close3x && tiley == close3y) {
                                        // Already in list
                                    } else {
                                        if (tilex == close4x && tiley == close4y) {
                                            // Already in list
                                        } else {
                                            /// Check against direction markers
                                            if (tilex == c1x && tiley == c1y) {
                                                // At marker
                                            } else {
                                                if (tilex == c2x && tiley == c2y) {
                                                    // At marker
                                                } else {
                                                    if (tilex == c3x && tiley == c3y) {
                                                        // At marker
                                                    } else {
                                                        if (tilex == c4x && tiley == c4y) {
                                                            // At marker
                                                        } else {
                                                            if (tilex == c5x && tiley == c5y) {
                                                                // At marker
                                                            } else {
                                                                if (tilex == c6x && tiley == c6y) {
                                                                    // At marker
                                                                } else {
                                                                    if (tilex == c7x && tiley == c7y) {
                                                                        // At marker
                                                                    } else {
                                                                        if (tilex == c8x && tiley == c8y) {
                                                                            // At marker
                                                                        } else {
                                                                            /// Add to third position
                                                                            close4x = close3x;
                                                                            close4y = close3y;
                                                                            close3x = tilex;
                                                                            close3y = tiley;
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
                        } else {
                            /// Check if closer than fourth closest point
                            var _dist_to_close4 = abs(targx - close4x) + abs(targy - close4y);
                            if (_dist_to_target < _dist_to_close4) {
                                /// Avoid duplicates and markers
                                if (tilex == closex && tiley == closey) {
                                    // Already in list
                                } else {
                                    if (tilex == close2x && tiley == close2y) {
                                        // Already in list
                                    } else {
                                        if (tilex == close3x && tiley == close3y) {
                                            // Already in list
                                        } else {
                                            if (tilex == close4x && tiley == close4y) {
                                                // Already in list
                                            } else {
                                                /// Check against direction markers
                                                if (tilex == c1x && tiley == c1y) {
                                                    // At marker
                                                } else {
                                                    if (tilex == c2x && tiley == c2y) {
                                                        // At marker
                                                    } else {
                                                        if (tilex == c3x && tiley == c3y) {
                                                            // At marker
                                                        } else {
                                                            if (tilex == c4x && tiley == c4y) {
                                                                // At marker
                                                            } else {
                                                                if (tilex == c5x && tiley == c5y) {
                                                                    // At marker
                                                                } else {
                                                                    if (tilex == c6x && tiley == c6y) {
                                                                        // At marker
                                                                    } else {
                                                                        if (tilex == c7x && tiley == c7y) {
                                                                            // At marker
                                                                        } else {
                                                                            if (tilex == c8x && tiley == c8y) {
                                                                                // At marker
                                                                            } else {
                                                                                /// Add to fourth position
                                                                                close4x = tilex;
                                                                                close4y = tiley;
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
        }
    }
}
