local utils = require('utils')

local world = {
    entities = {},
    entitiesToAdd = {},
    entitiesToRemove = {},
    entityCount = 0,
    systems = {},
    systemsToAdd = {},
    systemsToRemove = {},
    archetypes = {}
}

function world:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end


-- MARK: - Entities Management
function world:addEntity(entity)
    table.insert(self.entitiesToAdd, entity)
end

function world:removeEntity(entity)
    table.insert(self.entitiesToRemove, entity)
end

function world:manageEntities()
    for _, entityToAdd in ipairs(self.entitiesToAdd) do
        table.insert(self.entities, entityToAdd)
        self.entities[entityToAdd] = #self.entities
        self.entityCount = self.entityCount + 1
        self:manageArchetype(entityToAdd)
    end

    for _, entityToRemove in ipairs(self.entitiesToRemove) do
        local lastEntityIndex = #self.entities
        local lastEntity = self.entities[lastEntityIndex]

        utils:swap(self.entities, entityToRemove, lastEntity)
        table.remove(self.entities, lastEntityIndex)
        self.entities[entityToRemove] = nil
        self.entityCount = self.entityCount - 1
    end

    self.entitiesToAdd = {}
    self.entitiesToRemove = {}
end

-- MARK: - Systems Management

function world:addSystem(system)
    table.insert(self.systems, system)
end

function world:removeSystem(system)
    table.insert(self.systems, system)
end

function world:manageSystems()
    for _, systemToAdd in ipairs(self.systemsToAdd) do
        table.insert(self.systems, systemToAdd)
        self.systemsToAdd[systemToAdd] = #self.systems
        self:registerArchetype(systemToAdd.archetype)
        systemToAdd:onAdd()
    end

    for _, systemToRemove in ipairs(self.systemsToRemove) do
        local lastSystemIndex = #self.systems
        local lastSystem = self.systems[lastSystemIndex]

        utils:swap(self.systems, systemToRemove, lastSystem)
        table.remove(self.systems, lastSystemIndex)
        self.systems[systemToRemove] = nil
        systemToRemove:onRemove()
    end

    self.systemsToAdd = {}
    self.systemsToRemove = {}
end

-- MARK: - World Life Cycle

function world:load() end

function world:update(dt)
    self:manageEntities()
    self:manageSystems()

    for system in ipairs(self.systems) do
        system:update()
    end
end

-- MARK: - Private Functions

function world:manageArchetype(entity)
    local entityArchetypePattern = table.concat(entity.archetype, '|')
    for archetype in ipairs(self.archetypes) do
        if utils:matchArchetypePattern(entityArchetypePattern, archetype) then
            local archetypeTable = self.archetypes[archetype]
            table.insert(archetypeTable, entity.components)
        end
    end
end

function world:registerArchetype(archetype)
    table.sort(archetype)
    local archetypePattern = table.concat(archetype, '|')
    table.insert(self.archetypes, archetypePattern)
    self.archetypes[archetypePattern] = {}
end

return world



