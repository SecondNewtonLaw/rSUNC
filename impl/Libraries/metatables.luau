--[=[
    Provides a wide range of APIs to interact with metatables in a myriad of ways.

    @class metatables
    @tag Library
]=]

local metatables = {}

--[=[
    All possible metafields in Luau.
    @type metafield "__index" | "__newindex" | "__mode" | "__namecall" | "__call" | "__iter" | "__len" | "__eq" | "__add" | "__sub" | "__mul" | "__div" | "__idiv" | "__mod" | "__pow" | "__unm" | "__lt" | "__le" | "__concat" | "__type"
    @within metatables
    @tag Type
]=]
type metafield =
    "__index"
    | "__newindex"
    | "__mode"
    | "__namecall"
    | "__call"
    | "__iter"
    | "__len"
    | "__eq"
    | "__add"
    | "__sub"
    | "__mul"
    | "__div"
    | "__idiv"
    | "__mod"
    | "__pow"
    | "__unm"
    | "__lt"
    | "__le"
    | "__concat"
    | "__type"
    | "__tostring"

--[=[
    Returns the metatable of the given object, even if the `__metatable` metafield is set.

    @within metatables
    @param object T -- The object to get the metatable of.
    @return { [metafield]: any } | nil -- The metatable of the object.

    :::danger Hooking
    This function should never be used to perform metatable hooks. Use `metatables.hookmetamethod` instead.
    :::
]=]
function metatables.getrawmetatable<T>(object: T): { [metafield]: any } | nil
    return nil :: any
end

--[=[
    Sets the metatable of `object` and returns the previous metatable of it..

    @within metatables
    @param object T -- The object to get the metatable of.
    @param metatable { [metafield]: any } | nil -- The metatable to set.
    @return { [metafield]: any } | nil -- The previous metatable of the object (if it had any).
]=]
function metatables.setrawmetatable<T>(object: T, metatable: { [metafield]: any } | nil): { [metafield]: any } | nil
    return nil :: any
end

--[=[
    Returns the metafield (if existing) of the metatable the object has.

    @within metatables
    @param object T  -- The object with a metatable to get the metafield of.
    @param metafield metafield -- The metafield to get.
    @return U -- The metafield of the object.
    @error invalid metafield -- The metatable is invalid (bad metafield name)
    @error no metatable found -- No metatable was found on the given object.
    @error no metafield found -- No metafield was found on the given object's metatable.

]=]
function metatables.getmetafield<T, U>(object: T, metafield: metafield): T?
    return nil :: any
end
--[=[
    Checks if the given object has a specific metafield.

    @within metatables
    @param object T -- The object to check.
    @param metafield metafield -- The metafield to check.
    @return boolean -- If true, the object has the metafield.
    @error invalid metafield -- The metatable is invalid (bad metafield name)
    @error no metatable found -- No metatable was found on the given object.
    
]=]
function metatables.hasmetafield<T>(object: T, metafield: metafield): boolean
    return nil :: any
end

--[=[
    Checks if the given object has a metatable.

    @within metatables
    @param object T -- The object to check.
    @return boolean -- If true, the object has a metatable.
]=]
function metatables.hasmetatable<T>(object: T): boolean
    return nil :: any
end

--[=[
    Checks if the the given table is marked as read-only.

    @within metatables
    @param object { [any]: any } -- The table to check.
    @return boolean -- If true, the table is read-only.
    
    :::tip Usage
    Normally used on metatables to allow modifying the table, but works on any table, regardless if they're a metatable or not,
    :::
]=]
function metatables.isreadonly(object: { [any]: any }): boolean
    return nil :: any
end

--[=[
    Hooks the given object's metatable metamethod with the provided callback.

    @within metatables
    @param object T -- The object to hook.
    @param metamethod metafield -- The metamethod to hook.
    @param callback (U...) -> O... -- The callback to hook the metamethod with.
    @return (U...) -> O... -- The original metamethod
    @error invalid metafield -- The metatable is invalid (bad metafield name)
    @error no metatable found -- No metatable was found on the given object.
    @error no metafield found -- No metafield was found on the given object's metatable.
    @error metafield is not a function -- The metafield is not implemented as a function, but as a property.

    :::danger Implementation
    This function must contain an argument guard which controls that the function is given the correct number of arguments. This function should use a form of `hookfunction` to hook, and most NOT replace the metatable's metamethods directly.
    :::

    :::danger Argument Guard
    You may disable the integrated argument guard by using a `vararg` function. This dismisses stack size checks (it is up to you to make sure the correct number of arguments are obtained).
    :::

    :::info Hookfunction
    This function may inherit errors and warnings from [`hookfunction`](/api/closures#hookfunction).
    :::
]=]
function metatables.hookmetamethod<T, U..., O...>(object: T, metamethod: metafield, callback: (U...) -> O...): (U...) -> O...
    return nil :: any
end

--[=[
    Restores a metamethod hooked with `hookmetamethod`.

    @within metatables
    @param object T -- The object with the metatable and metamethod to restore.
    @param metamethod metafield -- The name of the metamethod to restore.
    @error invalid metafield -- The metatable is invalid (bad metafield name)
    @error no metatable found -- No metatable was found on the given object.
    @error no metafield found -- No metafield was found on the given object's metatable.
    @error metafield is not a function -- The metafield is not implemented as a function, but as a property.

    :::info restorefunction
    This function may inherit errors and warnings from [`restorefunction`](/api/closures#restorefunction)!
    :::
]=]
function metatables.restoremetamethod<T>(object: T, metamethod: metafield): () end

return metatables
