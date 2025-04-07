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
    Returns the metafield (if existing) of the metatable the object has.

    @within metatables
    @param object T  -- The object with a metatable to get the metafield of.
    @param metamethod metafield -- The metafield to get.
    @return U -- The metafield of the object.
    @error No metatable found -- No metatable was found on the given object.


]=]
function metatables.getmetafield<T, U>(object: T, metamethod: metafield): T?
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
    
    :::danger Implementation
    This function must contain an argument guard which controls that the function is given the correct number of arguments. This function should use a form of `hookfunction` to hook, and most NOT replace the metamtable's metamethods function object.
    :::
]=]
function metatables.hookmetamethod<T, U..., O...>(object: T, metamethod: metafield, callback: (U...) -> O...): (U...) -> O...
    return nil :: any
end

return metatables
