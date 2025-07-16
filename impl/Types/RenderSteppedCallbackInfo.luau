--[=[
    Describes a RenderStepped callback's information.
    @class RenderSteppedCallbackInfo
    @tag Type
]=]
local RenderSteppedCallbackInfo = {}

--[=[
    The execution priority of the callback (e.g., `Enum.RenderPriority.Camera`).

    @prop Priority number
    @within RenderSteppedCallbackInfo
    @readonly
]=]
RenderSteppedCallbackInfo.Priority = 0

--[=[
    The name given to the callback, often indicating its purpose.

    @prop Name string
    @within RenderSteppedCallbackInfo
    @readonly
]=]
RenderSteppedCallbackInfo.Name = ""

--[=[
    A boolean indicating if the callback originates from a different Luau Virtual Machine (e.g., an Actor thread).

    @prop Foreign boolean
    @within RenderSteppedCallbackInfo
    @readonly
]=]
RenderSteppedCallbackInfo.Foreign = false

--[=[
    The Luau thread (coroutine) this callback belongs to. `nil` if `Foreign` is true unless Argument #1 `bypassForeignCheck` of `getrendersteppedlist` is true.

    @prop Thread thread?
    @within RenderSteppedCallbackInfo
    @readonly
]=]
RenderSteppedCallbackInfo.Thread = nil

--[=[
    The Luau function associated with this callback. `nil` if `Foreign` is true unless Argument #1 `bypassForeignCheck` of `getrendersteppedlist` is true.

    @prop Function (() -> ())?
    @within RenderSteppedCallbackInfo
    @readonly
]=]
RenderSteppedCallbackInfo.Function = nil

return RenderSteppedCallbackInfo