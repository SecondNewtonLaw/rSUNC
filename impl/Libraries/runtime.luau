--[=[
    Contains functions that modify the Lua(u) Virtual Machine runtime.

    @class runtime
    @tag Library
]=]
local runtime = {}

--[[
    [X] disablenative(): () -- Disables execution of native code generated functions.
    [X] enablenative(): () -- Enables (if available) execution of native code generated functions.

    [X] getstringatom(string): number -- Returns the atom of the given string.
    [X] getstringhash(string): number -- Returns the hash assigned to a string by Lua(u). Useful for quick comparisons.

    [X] enablepointerencoding(): () -- Enables pointer encoding (sets the pointer encryption key back to the value RBX::ScriptContext assigned it).
    [X] disablepointerencoding(): () -- Disables pointer encoding, setting ptrenc[0] = 1; ptrenc[1..3] = 0;, disabling pointer encoding completely..

    [X] isinstance(obj: Instance): boolean -- Returns whether the given object is a userdata<Instance>. You must not implement this as a fucking __type check.

    setluaufflag(flagName: string, flagValue: boolean): () -- Sets a fast flag in the Lua(u) VM for specific behaviour.
]]

--[=[
    Disables the execution of native generated code.

    :::tip Hooking functions
    You may need to call this function in the future before hooking functions!
    :::

    @within runtime
]=]
function runtime.disablenative() end

--[=[
    Enables the execution of native generated code, if the Lua(u) VM is prepared for it.

    @within runtime
]=]
function runtime.enablenative() end

--[=[
    Obtains the 'atom' of the given string `str`.
    
    @param str string -- The string to get the atom of.
    @return number -- The atom of str, as a signed 16 bit integer (short/I16/std::int16_t).

    @within runtime
]=]
function runtime.getstringatom(str: string): number
	return nil :: any
end

--[=[
    Obtains the hash of the given string `str` that was assigned to it by Lua(u).
    
    @param str string -- The string to get the hash of.
    @return number -- The hash of str, as an unsigned integer.
    
    @within runtime
]=]
function runtime.getstringhash(str: string): number
	return nil :: any
end

--[=[
    Enables pointer encoding for the Lua(u) VM.

    @within runtime

    :::info Implementation
    This function should be implemented as a way to restore the pointer encryption key to the original value, using the key that RBX::ScriptContext contains.
    While any value is acceptable, it is recommended to use the value from RBX::ScriptContext in order to avoid issues.
    :::
]=]
function runtime.enablepointerencoding(): () end

--[=[
    Disables pointer encoding for the Lua(u) VM.

    @within runtime

    :::tip Executor Development
    This can help locate objects in memory to find out about their true structure in-memory.
    :::
]=]
function runtime.disablepointerencoding(): () end

--[=[
    Returns whether the given object is a userdata of type Instance.

    @param obj userdata -- The object to check.
    @return boolean -- Whether the object is a userdata of type Instance.
    @within runtime

    :::warning Implementation
    This function should **NEVER** be implemented as a __type check. You must figure out a way to do it yourself.
    :::
]=]
function runtime.isinstance(obj: Instance): boolean
	return nil :: any
end

--[=[
    Sets a fast flag in the Lua(u) VM for specific behaviour.

    @param flagName string -- The name of the flag to set.
    @param flagValue boolean -- The value to set the flag to.
    @within runtime

    :::info Implementation
    This functions should affect the Roblox VM as well if you are using a RVM/CLVM execution method.
    :::
]=]
function runtime.setluaufflag(flagName: string, flagValue: boolean): () end

--[=[
    Disables the error logging Roblox does on the VM. This is **NOT** the same as disabling error logging in the VM itself, it simply inutilizes the `ScriptContext.Error` signal.
    
    @within runtime
    
    :::info Implementation
    This function can be implemented using hooksignal or getconnections, but it must continue to work ***even*** if new connections are added to the event.
    :::
]=]
function runtime.disableerrorlogging(): () end
--[=[
    Enables the error logging Roblox does on the VM. This is **NOT** the same as disabling error logging in the VM itself, it simply enables the `ScriptContext.Error` signal again after being disabled.
    
    @within runtime
]=]
function runtime.enableerrorlogging(): () end

return runtime
