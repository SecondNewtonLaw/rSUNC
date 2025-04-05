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

return global
