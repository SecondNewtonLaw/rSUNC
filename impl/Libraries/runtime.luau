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

    ### Example
    ```lua
    -- This signals the compiler to enable native code generation on the protos the main proto contains!
    -- This means herein if the LVM supports native code, it will be enabled for the functions the code has (and if the compiler believes it to be 'benefitial'!)
    --!native 

    local function a()
        local function b()
            print("hi b")
            print(runtime.isnativecode(a)) -- true
            print(runtime.isnativecode(b)) -- true
            runtime.disablenative(debug.info(1, "f")) -- entry point is now bytecode, should be able to be restored without limitations.
            runtime.disablenative(debug.info(2, "f")) -- entry point is now bytecode, should be able to be restored without limitations.
            print(runtime.isnativecode(a)) -- false
            print(runtime.isnativecode(b)) -- false
        end
        print("hi a")
        b()
    end

    -- Uncomment if you remove --!native
    -- runtime.enablenative(a)
    a()
    ```

    :::danger Implementation
    Depending on your implementation, you may be unable to remove native code from a function that is on the callstack currently. Investigate into the CodeGen implementation to learn how to do things properly.
    :::
]=]
function runtime.disablenative<T..., U...>(fn: (T...) -> U...): () end

--[=[
    Enables the execution of native generated code, if the Lua(u) VM is prepared for it.

    @within runtime
    @param fn (T...) -> U... -- The function to enable native code execution for.
    @error VM is not supported -- The VM does not support native code.
]=]
function runtime.enablenative<T..., U...>(fn: (T...) -> U...) end

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
    Gets the raw address of the provided value using `topointer`.

    @within runtime
    @param obj any -- The object to retrieve the address of.
    @return string -- The raw address.

    
]=]

function runtime.getrawaddress<T>(obj: T): string
    return nil :: any
end

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
    Returns the userdata tag for the provided object.

    @within runtime
    @param obj userdata -- The object which inherits from userdata.
    @return number -- The userdata tag of the object.

]=]

function runtime.getuserdatatag(obj: userdata): number
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

    @within runtime
    @return string -- The hash of your tool's calculated HWID, as a hex string.
    
    :::danger HWID Hashing
    After performing your own tool's HWID calculations, you are expected to provide a hex-formatted hash that cannot be reconstructed back to the original HWID.
    :::
]=]
function runtime.gethwid(): string
    return nil :: any
end

--[=[
    Returns whether the current thread was created by the executor.

    @within runtime
    @return boolean -- Whether the current thread was created by the executor.
]=]
function runtime.checkcaller(): boolean
    return nil :: any
end

--[=[
    Returns the current namecall method.

    @within runtime
    @return string? -- The namecall method, if nil, there is no namecall set.
]=]
function runtime.getnamecallmethod(): string?
    return nil
end

--[=[
    Sets the current namecall method.

    @within runtime
    @param newNamecall string -- The namecall method to set.
    @return string? -- The namecall method, if nil, there is no namecall set.
    @error no namecall currently -- There is no namecall currently occurring.
]=]
function runtime.setnamecallmethod(newNamecall: string): string?
    return nil
end

--[=[
    Gets the current thread identity and capabilities.

    @within runtime
    @param th thread? -- The thread to get the identity of (if nil, defaults to current thread)
    @return number -- The thread identity of the current thread (or given thread)
]=]
function runtime.getthreadidentity(th: thread?): number
    return nil :: any
end

--[=[
    Sets the current thread identity and capabilities.

    @within runtime
    @param threadIdentity number -- The thread identity to set. Must be between 0 and 8
]=]
function runtime.setthreadidentity(threadIdentity: number) end

--[=[
    Sets the maximum amount of frames per second (fps) to run the game engine can run at.

    @within runtime
    @param fps number? -- The maximum amount of frames per second (fps). If no value is provided, it automatically defaults to 1000.
    @error invalid fps value -- The fps value is invalid, i.e., it is less than 0

    :::info Implementation
    This function should set the FPS to 1000 if the valueo of `fps` is 0.
    :::
]=]
function runtime.setfpscap(fps: number?): () end

--[=[
    Sets the maximum amount of frames per second (fps) to run the game engine can run at.

    @within runtime
    @return number -- The current target FPS of the game engine.
]=]
function runtime.getfpscap(): number
    return nil :: any
end

--[=[
    Loads a scrap from the Rubis API.

    @within runtime
    @return ((() -> ()) | nil), string? -- The closure that was loaded, if successful, or nil if it failed with a second string return.
    @tag Optional

    :::tip 
    This is simply `loadstring`, but specific towards the Rubis API.
    :::
]=]
function runtime.rubisload(): ((() -> ()) | nil, string?)
    return nil :: any
end

--[=[
    Returns the bytecode of the given Luau code.

    @within runtime
    @param luauCode string -- The Luau code to get the bytecode of.
    @return string -- The bytecode of the given Luau code.
    @tag Optional
]=]
function runtime.getbytecode(luauCode: string): string
    return nil :: any
end

--[=[
    Decompiles the given Luau code or script.

    @within runtime
    @param luauCodeOrScript LuaSourceContainer | string -- The Luau code or script to decompile.
    @return string -- The decompiled Luau code.
    @tag Optional
]=]
function runtime.decompile(luauCodeOrScript: LuaSourceContainer | string): string
    return nil :: any
end

--[=[
    Disassembles the given Luau code or script.

    @within runtime
    @param luauCodeOrScript LuaSourceContainer | string -- The Luau code or script to decompile.
    @return string -- The disassembled Luau code.
    @tag Optional
]=]
function runtime.disassemble(luauCodeOrScript: LuaSourceContainer | string): string
    return nil :: any
end

return runtime
