--[=[
    This is not a library! It represents any globals pushed to the thread's environment!

    @class global
    @tag Miscellaneous
]=]
local global = {}

do
    --[=[
        The global roblox environment, as a table.
        @prop _RENV { [any]: any }
        @within global
        @tag Global
    ]=]
    global._RENV = {}

    --[=[
        The global executor environment, as a table.
        @prop _GENV { [any]: any }
        @within global
        @tag Global
    ]=]
    global._GENV = {}
    --[=[
        The current thread's environment, as a table.
        @prop _ENV { [any]: any }
        @within global
        @tag Global
    ]=]
    global._ENV = {}
end

--[=[
    Fetches the environment of a thread.

    @param thread thread -- The thread to fetch the environment of.
    @return { [any]: any } -- The environment of the thread.
    @within global
    @tag Global
]=]
function global.gettenv(thread: thread?): { [any]: any }
    return nil :: any
end

--[=[
    Fetches the Body of an HTTP server using a GET HTTP request.

    @param url string -- The URL to send the request to.
    @return string -- The body of the response.
    @within global
    @yields
    @tag Global
    @error Invalid protocol (expected 'http://' or 'https://') -- The provided URL is not on the form of an HTTP request.
]=]
function global.httpget(url: string): string
    return nil :: any
end

--[=[
    Creates a Win32 MessageBox with the provided text, caption, and flags. Yields until the message box is closed.

    @param text string -- The text to display in the message box.
    @param caption string -- The caption to display in the message box.
    @param flags number -- The flags to apply to the message box.
    @return number -- The result of the message box.
    @within global
    @tag Global
    @yields
    @error Win32 error '%s' -- An error occured while trying to display the messagebox. The Win32 error will be in-place of the '%s'.  
]=]
function global.messagebox(text: string, caption: string, flags: number): number
    return nil :: any
end

--[=[
    Obtains the global environment of the executor. Contains all of rSUNC globals.

    @within global
    @tag Global
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
function global.getgenv(): { [any]: any }
    return nil :: any
end

--[=[
    Returns the global environment of main thread of Luau. This environment is __different__ from the executor environment.

    @within global
    @tag Global
    @return {[any]: any} -- The global environment of main thread of Luau.

    :::info Sandboxing
    You must __NOT__ modify this environment under __ANY__ circumstance. __ANY__ modification will be observable by all threads in the VM.
    :::
]=]
function global.getrenv(): { [any]: any }
    return nil :: any
end

--[=[
    Returns the Luau registry.

    @within global
    @tag Global
    @return {[any]: any} -- The Luau registry
]=]
function global.getreg(): { [any]: any }
    return nil :: any
end

--[=[
    Returns the `_G` and `shared` script globals.

    @within global
    @tag Global
    @return { _G: {[any]: any}, shared: {[any]: any} } 

]=]
function global.getscriptglobals(): { _G: { [any]: any }, shared: { [any]: any } }
    return nil :: any
end

return global
