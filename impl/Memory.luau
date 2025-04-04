--[=[
    Provides functions to manipulate the Garbage Collector and memory in general.
    @class memory
    @tag Library
]=]
local memory = {}

do
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
end

--[=[
    Returns a list of objects currently 'alive' in the garbage collector.

    @within memory
    @param includeTables boolean? -- Whether to include tables in the list. Defaults to `false` if not provided.
    @return { vector | buffer | { [any]: any } | string | (...any) -> ...any } | { vector | buffer | string | (...any) -> ...any } -- A list of objects currently 'alive' in the garbage collector.

    :::warning Implementation
    This function must automatically suspend the GC to retrieve the list of objects that are correct for when the call originates.
    :::
]=]
function memory.getgc(includeTables: boolean): { vector | buffer | { [any]: any } | string | (...any) -> ...any }
	return nil :: any
end

--[=[
    Suspends all GC operations temporarily, returning the current state of the Garbage Collector to resume it.
    @within memory
    @return GcState -- The current state of the Garbage Collector, before suspension.

    :::warning Memory Usage
    After this function is called, memory usage may increase, as after this call the garbage collector is simply no longer collecting memory.
    You may forcefully request the GC to run using `memory.gc` or `memory.stepgc`. Granting you full control over the GC.
    :::

    :::warning Resumption after Suspension
    After the Garbage Collector is suspended, a call to `memory.resumegc` must follow eventually.
    If the thread does not resume the GC and it stops execution (i.e.: thread yields or dies), it will automatically resume itself on the next scheduler cycle in order to prevent a memory leak.
    :::

    @error Already suspended -- The Garbage collector is already suspended. You must first resume it using memory.resumegc before calling memory.suspendgc again.
]=]
function memory.suspendgc(): any
	return nil :: any
end

--[=[
    Resumes the Garbage Collector from the previous state
    @within memory
    @error Garbage Collector Not Suspended -- The garbage collector is not suspended, you cannot resume it!

]=]
function memory.resumegc(): ()
	return nil :: any
end

--[=[
    Retrieves a copy of the current state of the garbage collector.

    @within memory
    @return GcState -- The current state of the Garbage Collector
]=]
function memory.getgcstate(): any
	return nil :: any
end

--[=[
    Executes a full garbage collection cycle, of regardless if it should be ran or not.
    This will temporarily [stop the world](https://stackoverflow.com/questions/40182392/does-java-garbage-collect-always-has-to-stop-the-world) to execute a full GC step.
    :::warning
    This may have a performance cost depending on how big the heap is, and could temporarily pause Roblox!
    :::

    @within memory
]=]
function memory.gc(): () end

--[=[
    Executes a step on the garbage collection cycle, of regardless if it should be ran or not.

    @within memory
]=]
function memory.stepgc(): () end

return memory
