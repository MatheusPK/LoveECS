local system = {
    world = nil,
    archetype = {}
}
--[[
Creates new system
-> archetype = Set of componentes. ex: {COMPONENTS.TRANSLATION, COMPONENTS.COLLIDER}
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
    local componentSet = self:getComponentSet()
    if componentSet == nil then return end
    self:process(dt, componentSet)
end

function system:process(dt, componentSet) end

function system:onRemove() end

function system:getComponentSet()
    local archetypePattern = table.concat(self.archetype, "|")
    return self.world.archetypes[archetypePattern]
end

return system