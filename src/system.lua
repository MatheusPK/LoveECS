local system = {
    world = nil,
    archetype = {}
}
--[[
Creates new system
-> archetype = Set of componentes. ex: {"POSITION", "VELOCITY", "HEALTH"}
]]
function system:new(world, archetype)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.world = world
    o.archetype = archetype
    return o
end

-- MARK: - System Life Cycle
function system:onAdd() end

function system:update(dt)
    local components = self:getComponents()
    self:process(dt, components)
end

function system:process(dt, components) end

function system:onRemove() end

function system:getComponents()
    local archetypePattern = table.concat(self.archetype, "|")
    return self.world.archetypes[archetypePattern]
end

return system