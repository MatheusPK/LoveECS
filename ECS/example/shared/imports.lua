-- MARK: - Components
COMPONENTS = {
    COLLIDER  = "COLLIDER",
    INPUT     = "INPUT",
    SPEED     = "SPEED",
    TRANSFORM = "TRANSFORM"
}

-- MARK: - Entities
require("example.entities.player")
require("example.entities.player2")

-- MARK: - Systems
require("example.systems.drawSystem")
require("example.systems.inputSystem")
require("example.systems.inputMovementSystem")

