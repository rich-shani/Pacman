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
    ini_write_real("highscores", "pacplusscore", global.pacplusscore);
    ini_write_real("highscores", "pacrandscore", global.pacrandscore);
    ini_write_real("highscores", "pacplusrandscore", global.pacplusrandscore);
    
    // ===== MS. PACMAN SCORES =====
    /// Ms. Pacman high scores
    ini_write_real("highscores", "mspacscore", global.mspacscore);
    ini_write_real("highscores", "mspacplusscore", global.mspacplusscore);
    ini_write_real("highscores", "mspacrandscore", global.mspacrandscore);
    ini_write_real("highscores", "mspacplusrandscore", global.mspacplusrandscore);
    
    // ===== JR. PACMAN SCORES =====
    /// Jr. Pacman high scores
    ini_write_real("highscores", "jrpacscore", global.jrpacscore);
    ini_write_real("highscores", "jrpacplusscore", global.jrpacplusscore);
    ini_write_real("highscores", "jrpacrandscore", global.jrpacrandscore);
    ini_write_real("highscores", "jrpacplusrandscore", global.jrpacplusrandscore);
    
    // ===== HANGLY MODE SCORES =====
    /// Hangly mode high scores
    ini_write_real("highscores", "hanglyscore", global.hanglyscore);
    ini_write_real("highscores", "hanglyplusscore", global.hanglyplusscore);
    
    // ===== NEW MODE SCORES =====
    /// New mode high scores
    ini_write_real("highscores", "newscore", global.newscore);
    ini_write_real("highscores", "newplusscore", global.newplusscore);
    
    // ===== ULTRA MODE SCORES =====
    /// Ultra mode high scores
    ini_write_real("highscores", "ultrascore", global.ultrascore);
    ini_write_real("highscores", "ultraplusscore", global.ultraplusscore);
    
    // ===== MS. PACMAN VARIANTS =====
    /// Ms. Pacman variant high scores
    ini_write_real("highscores", "mspmpscore", global.mspmpscore);
    ini_write_real("highscores", "mspmpplusscore", global.mspmpplusscore);
    ini_write_real("highscores", "pacjrscore", global.pacjrscore);
    ini_write_real("highscores", "pacjrplusscore", global.pacjrplusscore);
    ini_write_real("highscores", "strangescore", global.strangescore);
    ini_write_real("highscores", "strangeplusscore", global.strangeplusscore);
    
    // ===== JR. PACMAN VARIANTS =====
    /// Jr. Pacman variant high scores
    ini_write_real("highscores", "extendedscore", global.extendedscore);
    ini_write_real("highscores", "extendedplusscore", global.extendedplusscore);
    ini_write_real("highscores", "c64score", global.c64score);
    ini_write_real("highscores", "c64plusscore", global.c64plusscore);
    ini_write_real("highscores", "a2600score", global.a2600score);
    ini_write_real("highscores", "a2600plusscore", global.a2600plusscore);
    
    // ===== CHAMPION MODE SCORES =====
    /// Champion mode high scores
    ini_write_real("highscores", "champscore", global.champscore);
    ini_write_real("highscores", "champplusscore", global.champplusscore);
    ini_write_real("highscores", "arrscore", global.arrscore);
    ini_write_real("highscores", "arrplusscore", global.arrplusscore);
    ini_write_real("highscores", "bleachscore", global.bleachscore);
    ini_write_real("highscores", "bleachplusscore", global.bleachplusscore);
    
    /// Close INI file to save changes
    /// This ensures all data is written to disk
    ini_close();
}
