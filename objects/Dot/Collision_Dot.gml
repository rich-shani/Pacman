/// ===============================================================================
/// DOT OBJECT - COLLISION EVENT WITH PAC
/// ===============================================================================
/// Purpose: Handle dot collection when Pac collides with dot
/// Called: When Pac object collides with this dot
///
/// Responsibilities:
/// 1. Destroy the dot instance
/// 2. Increment dot counter
/// 3. Remove dot tiles from tile layers
/// ===============================================================================

// ===== DESTROY DOT INSTANCE =====
/// Destroy this dot instance when collected
/// The 'other' variable refers to the Pac object that collided
with (other) {
    instance_destroy();
}
