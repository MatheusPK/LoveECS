local _world = require('world')
local _entity = require('entity')
local _component = require('component')
local _system = require('system')

local ecs = {
    world = _world,
    entity = _entity,
    component = _component,
    system = _system
}

return ecs