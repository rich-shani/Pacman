/// ===============================================================================
/// gameend() - SAVE HIGH SCORES TO FILE
/// ===============================================================================
/// Purpose: Save all high scores to persistent storage file
/// Called: When game ends or high scores need to be saved
///
/// Responsibilities:
/// 1. Open high scores INI file
/// 2. Write all game variant high scores
/// 3. Close file to ensure data is saved
///
/// File Format:
/// Uses GameMaker's INI file system for persistent storage
/// File: highscores.ini
/// Section: "highscores"
/// Keys: Various score names (pacscore, mspacscore, etc.)
/// ===============================================================================

function gameend() {
    /// Open high scores INI file for writing
    /// If file doesn't exist, it will be created
    ini_open("highscores.ini");
    
    // ===== STANDARD PACMAN SCORES =====
    /// Standard Pacman high scores
    ini_write_real("highscores", "pacscore", global.pacscore);
    
    // ===== MS. PACMAN SCORES =====
    /// Ms. Pacman high scores
    ini_write_real("highscores", "mspacscore", global.mspacscore);
    
    /// Close INI file to save changes
    /// This ensures all data is written to disk
    ini_close();
}
