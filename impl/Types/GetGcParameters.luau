--[=[
    Used to extend the parameters for `memory.getgc` from legacy versions of the API.

    @class GetGcParameters
    @tag Type
]=]
local GetGcParameters = {}

--[=[
    The types that the returned table should include.
    
    If not specified or not a table, defaults to returning all types.

    @prop Types { string }
    @within GetGcParameters
]=]
GetGcParameters.Types = {}

--[=[
    Whether or not the returned table should be a weak table. This is recommended to be set to true.

    If not specified, defaults to true.

    @prop UseWeakTable boolean
    @within GetGcParameters
]=]
GetGcParameters.UseWeakTable = true