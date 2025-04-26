--[=[
    Represents a connection object obtained from `instances.getconnections`.

    This object provides detailed information about a single connection to an `RBXScriptSignal` and allows manipulating it.

    Connection objects can be compared with each other using the equality operator (`==`). Internally, this checks if they represent the same underlying connection slot.

    @class Connection
    @tag Type
]=]
local Connection = {}

--[=[
    A boolean indicating if the connection belongs to a different Luau Virtual Machine (e.g., an Actor thread) or is a C function connection.

    @prop ForeignState boolean
    @within Connection
    @readonly
]=]
Connection.ForeignState = false

--[=[
    The Luau function associated with this connection. Returns `nil` if `ForeignState` is true.

    @prop Function ((...any) -> ...any)?
    @within Connection
    @readonly
]=]
Connection.Function = nil

--[=[
    A boolean indicating if the connection is currently enabled. Setting this to `false` is equivalent to calling `Disable`, setting it to `true` is equivalent to calling `Enable`.

    @prop Enabled boolean
    @within Connection
]=]
Connection.Enabled = true

--[=[
    A boolean indicating if this is a connection to a Luau function (as opposed to a C function).

    @prop LuaConnection boolean
    @within Connection
    @readonly
]=]
Connection.LuaConnection = true

--[=[
    The Luau thread (coroutine) this connection belongs to. Returns `nil` if `ForeignState` is true.

    @prop Thread thread?
    @within Connection
    @readonly
]=]
Connection.Thread = nil

--[=[
    A boolean indicating if this connection was created using `ConnectOnce`. Such connections automatically disconnect after firing once.

    @prop IsOnce boolean
    @within Connection
    @readonly
]=]
Connection.IsOnce = false

--[=[
    Disconnects the signal connection. After calling this, the `Connection` object becomes unusable and attempting to access its properties or methods will error.

    @within Connection
]=]
function Connection:Disconnect(): ()
    return nil
end

--[=[
    Enables the connection if it was previously disabled.

    @within Connection
]=]
function Connection:Enable(): ()
    return nil
end

--[=[
    Disables the connection without disconnecting it. The connection can be re-enabled later using `Enable` or by setting the `Enabled` property to true.

    @within Connection
]=]
function Connection:Disable(): ()
    return nil
end

--[=[
    Fires the connected function immediately with the provided arguments. Does nothing if `ForeignState` is true. If `IsOnce` is true, the connection will be disconnected after firing.

    @param ... any -- Arguments to pass to the connected function.
    @within Connection
]=]
function Connection:Fire(...: any): ()
    return nil
end

--[=[
    Schedules the connected function to be executed later (deferred) with the provided arguments via `task.defer`. Does nothing if `ForeignState` is true. If `IsOnce` is true, the connection will be disconnected after firing.

    @param ... any -- Arguments to pass to the connected function when deferred.
    @within Connection
]=]
function Connection:Defer(...: any): ()
    return nil
end

return Connection
