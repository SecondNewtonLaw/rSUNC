--[=[
    @class Memory
]=]
local memory = {}

-- TODO: Function proposal:
--      - memory.suspendgc(): GcState (custom userdata) -- Suspend GC
--      - memory.resumegc(GcState): ()  -- Resume GC
--      - memory.getgc(): { vector | buffer | table | string }
--      - memory.getcollectionthreshold(): () -- Hard, Luau doesn't have an std::size_t type built-in!

--[=[
    Executes a full garbage collection cycle.
    This will temporarily [stop the world](https://stackoverflow.com/questions/40182392/does-java-garbage-collect-always-has-to-stop-the-world) to execute a full GC step.
    :::warning
    This may have a performance cost, and could temporarily pause Roblox!
    :::

    @within Memory
]=]
function memory.gc(): () end

--[=[
    Executes a step on the garbage collection cycle.

    @within Memory
]=]
function memory.stepgc(): () end

return memory
