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
return global
