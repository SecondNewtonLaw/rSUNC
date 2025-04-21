--[=[
    Configuration options for the `filesystem.listfiles` function.

    @class ListfilesOptions
    @tag Type
]=]
local ListfilesOptions = {}

--[=[
    If true, recursively list contents of all subdirectories. Defaults to false.

    @prop Recursive boolean?
    @within ListfilesOptions
]=]
ListfilesOptions.Recursive = false

--[=[
    If true, include hidden files and folders in the listing. Defaults to true.

    @prop Hidden boolean?
    @within ListfilesOptions
]=]
ListfilesOptions.Hidden = true

return ListfilesOptions
