--!strict
--[=[
    @class rsunc
    @tag Library
]=]
local rsunc = {}

--[=[
    Obtains the global environment of the executor. Contains all of rSUNC globals.

    @within rsunc
    @return { [any]: any } -- The global environment of the executor.

    :::info Sandboxing
    All threads must be sandboxed. This means that modifications to the current thread's global environment should __NOT__ pollute the result of `getgenv`.
    
    Modifications done to the table returned by `getgenv` must be observable to all threads an executor makes, but not observable to other threads within the VM, such as game threads.
    :::

    ### Example:
    ```lua

    do
        -- Thread 1
        HelloVariable = "Hello"
        print(HelloVariable) -- prints 'Hello'
        print(HelloVariableViaGetGenv)  -- prints 'nil'
        print(getgenv().HelloVariableViaGetGenv)  -- prints 'nil'    

        getgenv().HelloVariableViaGetGenv = HelloVariable -- Set HelloVariableViaGetGenv to the value of HelloVariable (can be observed by Thread 2!)
        print(HelloVariable) -- prints 'Hello'
        print(HelloVariableViaGetGenv)  -- prints 'Hello'
        print(getgenv().HelloVariableViaGetGenv)  -- prints 'Hello'
    end
    -- ...
    do
        -- Thread 2 (runs after thread 1)
        print(HelloVariable) -- prints 'nil'
        print(HelloVariableViaGetGenv)  -- prints 'Hello'
        print(getgenv().HelloVariableViaGetGenv)  -- prints 'Hello'
    end

    ```
]=]
function rsunc.getgenv(): { [any]: any }
	return nil :: any
end

--[=[
    Returns the global environment of main thread of Luau. This environment is __different__ from the executor environment.

    @within rsunc
    @return {[any]: any}

    :::info Sandboxing
    You must __NOT__ modify this environment under __ANY__ circumstance. __ANY__ modification will be observable by all threads in the VM.
    :::
]=]
function rsunc.getrenv(): { [any]: any }
    return nil :: any
end

--[=[
    Returns the Luau registry.

    @within rsunc
    @return {[any]: any} -- The Luau registry
]=]
function rsunc.getreg(): { [any]: any }
	return nil :: any
end

--[=[
    Returns the `_G` and `shared` script globals.

    @within rsunc
    @return { _G: {[any]: any}, shared: {[any]: any} } 

]=]
function rsunc.getscriptglobals(): { _G: { [any]: any }, shared: { [any]: any } }
	return nil :: any
end

return rsunc
