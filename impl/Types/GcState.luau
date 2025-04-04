--[=[
    Contains the state of the Luau Garbage Collector at one point in time.
    @class GcState
    @tag Type
]=]
local GcState = {}
--[=[
    @prop GCThreshold userdata<std::size_t>
    @within GcState
    @readonly

    :::warning Representation in Luau
    This is a `std::size_t`, which is a 64-bit integer. Lua(u) cannot represent the type effectively. In order to counteract this, a string is returned when indexed by Lua(u).
    :::
]=]
GcState.GCThreshold = 0
