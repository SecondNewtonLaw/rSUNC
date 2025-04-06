--[=[
    Contains functions that modify the Lua(u) Virtual Machine runtime.

    @class runtime
    @tag Library
]=]
local runtime = {}

--[=[
    Disables the execution of native generated code for the provided function.

    :::tip Hooking functions
    You may need to call this function in the future before hooking functions!
    :::
        
    @within runtime
    @param fn (T...) -> U... -- The function to disable native code execution for.
    @error VM is not supported -- The VM does not support native code.
    @error the function is present on the callstack -- The function is present on the current threads callstack. You cannot disable native code for a function that is currently being executed.
]=]
function runtime.disablenative<T..., U...>(fn: (T...) -> U...): () end

--[=[
    Enables the execution of native generated code, if the Lua(u) VM is prepared for it.

    @within runtime
    @param fn (T...) -> U... -- The function to enable native code execution for.
    @error VM is not supported -- The VM does not support native code.

]=]
function runtime.enablenative() end

--[=[
    Checks if the current function is implemented in the form of native code (implemented in C or runs with generated native code).

    @within runtime
    @param fn (T...) -> U... -- The function to check.
    @return boolean -- Whether the function is implemented in native code or running with a native code implementation.    
]=]
function runtime.isnativecode<T..., U...>(fn: (T...) -> U...): boolean
    return nil :: any
end

--[=[
    Checks if the current Lua(u) VM can run native code.
    
    @within runtime
    @return boolean -- Whether the VM can run native code.
]=]
function runtime.can_vm_run_native_code(): boolean
    return nil :: any
end

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
    This can help locate objects in memory to find out about their true structure in memory.
    :::
]=]
function runtime.disablepointerencoding(): () end

--[=[
    Returns whether the given object is a userdata of type Instance.

    @param obj userdata -- The object to check.
    @return boolean -- Whether the object is a `userdata` of type `Instance`.
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
    Disables the error logging Roblox does on the VM. This is **NOT** the same as disabling error logging in the VM itself, it simply disables the `ScriptContext.Error` signal.
    
    @within runtime
    
    :::info Implementation
    This function can be implemented using `hooksignal` or `getconnections`, but it must continue to work ***even*** if new connections are added to the event.
    :::
]=]
function runtime.disableerrorlogging(): () end
--[=[
    Enables the error logging Roblox does on the VM. This is **NOT** the same as disabling error logging in the VM itself, it simply enables the `ScriptContext.Error` signal again after being disabled.
    
    @within runtime
]=]
function runtime.enableerrorlogging(): () end

--[=[
    Returns the Version hash of the current, running ROBLOX version. The version hash is the hash that follows the 'version' string in `version-...`.

    @return string -- The ROBLOX build hash.
    @within runtime
    @tag Optional
]=]
function runtime.getrbxbuildhash(): string
    return nil :: any
end

--[=[
    Returns the HWID for the running computer.

    @return string -- The hash of your tool's calculated HWID, as a hex string.
    
    :::danger HWID Hashing
    After performing your own tool's HWID calculations, you are expected to provide a hex-formatted hash that cannot be reconstructed back to the original HWID.
    :::
]=]
function runtime.gethwid(): string
    return nil :: any
end

return runtime
