# PACMAN_GM2

A comprehensive GameMaker recreation of classic Pac-Man arcade games and variants, built with GameMaker Studio 2 (GML).

## Overview

PACMAN_GM2 is an extensive project that faithfully recreates the original Pac-Man arcade experience along with numerous game variants and spin-offs. The project features multiple game modes, AI ghost behavior, complex maze designs, and authentic arcade gameplay mechanics.

### Featured Games

- **Pac-Man** - The classic arcade original
- **Hangly Man** - Early variant with unique mechanics
- **Pac-Man Jr** - 7 championship levels + 56 random levels
- **Ms. Pac-Man** - Including Ms. Pac-Man Plus variant
- **Arcade Variants** - Commodore 64 and Atari 2600 versions
- **Experimental Modes** - Ultra difficulty, championship levels, versus modes, and more

## Features

### Core Gameplay
- **Grid-based Movement** - Smooth 16-pixel snap movement with corner detection
- **Intelligent Ghost AI** - 4 unique ghosts (Blinky, Pinky, Inky, Clyde) with distance-based pathfinding
- **Dual-Player Support** - Play as Player 1 or Player 2 with independent controls
- **Lives System** - Traditional extra lives and death animations
- **Scoring System** - Authentic point collection and bonus fruit system
- **Power Pellets** - Frightened mode that makes ghosts vulnerable

### Extensive Content
- **200+ Playable Levels** - Original mazes plus custom and randomly generated levels
- **74 Sprites** - Character animations, ghosts, UI elements, and environmental graphics
- **47 Sound Effects** - Authentic arcade audio including chomp sounds, ghost effects, and music
- **Multiple Game Variants** - Support for 6+ different Pac-Man game types

### Game Modes
- **Classic Levels** - Original Pac-Man levels and variants
- **Championship Modes** - Curated difficult levels
- **Random Generation** - Procedurally generated mazes (37+ variants)
- **Array-Based Mazes** - Mathematically generated level patterns
- **Versus Modes** - Competitive gameplay options

## Project Structure

```
PACMAN_GM2/
├── sprites/           # 74 sprites (characters, ghosts, UI, environment)
├── sounds/            # 47 audio files (SFX and music)
├── rooms/             # 200+ game rooms/levels
├── scripts/           # 50+ GML scripts (game logic, AI, rendering)
├── objects/           # 25+ game objects (player, ghosts, UI, game control)
├── fonts/             # Custom fonts for UI
├── options/           # Game configuration
└── PACMAN_GM2.yyp     # GameMaker project file
```

## Key Systems

### Movement & Navigation
- Grid-aligned pathfinding with smooth corners
- 8-direction corner detection system
- Wall collision detection
- Restricted zone handling (NoUp areas)

### Ghost AI (chase_object)
- Individual AI for each ghost variant
- Distance-based targeting toward Pac-Man
- Wall avoidance and collision detection
- Cooperative ghost coordination
- Frightened mode behavior

### Game Objects
- **Pac / Mac** - Player characters with dual-player support
- **Blinky, Pinky, Inky, Clyde** - Enemy ghosts with AI
- **Dot** - Collectible pellets
- **Power** - Power pellets (frightened mode)
- **Fruit** - Bonus items
- **Wall** - Maze barriers
- **Menu, Title, Pauser, Cutscene** - UI and game state management

## Controls

### Player Controls
- **Arrow Keys / WASD** - Move Pac-Man
- **P** - Pause
- **Menu Navigation** - Use arrow keys and enter

## Technologies

- **Engine**: GameMaker Studio 2
- **Version**: 2024.14.1.210
- **Language**: GML (GameMaker Language)
- **Source Control**: Git

## Getting Started

1. Install **GameMaker Studio 2** (2024.14.1.210 or compatible)
2. Open `PACMAN_GM2.yyp` in GameMaker
3. Press **F5** to run the game
4. Navigate the menu to select a game variant and level

## Game Assets

### Sprites (74 Total)
- Player characters for each game variant
- 4 unique ghost designs
- Death animations
- Power-up effects
- Environment tiles and decorations

### Sounds (47 Total)
- Chomp sounds for each variant
- Ghost encounter sounds
- Power-up activation
- Level complete fanfare
- Game over effects
- Background music

### Levels (200+ Total)
Organized by game type:
- **Original Pac-Man** - Classic gameplay
- **Pac-Man Jr** - 11 curated + 56 random levels
- **Ms. Pac-Man** - 8 levels including variant
- **Arcade Ports** - 6 C64 + 7 Atari 2600 versions
- **Advanced Modes** - 32+ strange mazes, 5 ultra difficulty, 7 championship, 7 versus
- **Generated Content** - 37+ randomly generated levels

## Game Mechanics

- **Dot Collection** - Collect all dots to advance
- **Power Pellets** - Temporarily make ghosts vulnerable
- **Fruit Bonus** - Earn extra points
- **Lives** - Lose a life when caught by ghosts
- **Level Progression** - Complete levels to unlock new ones

## Development Notes

- Written entirely in GML (GameMaker Language)
- Event-driven architecture using GameMaker's object system
- Tile-based maze rendering with sprite-based characters
- Global state management for game progression
- Supports both single-player and multiplayer modes

## License

This project is a fan recreation of classic arcade games. All original game content and characters are properties of their respective copyright holders.

## Contributing

Feel free to contribute improvements, bug fixes, or new level designs to the project.

## Support

For issues, questions, or suggestions, please open an issue in the repository.

---

Built with ❤️ in GameMaker Studio 2