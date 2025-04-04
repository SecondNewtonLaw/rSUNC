--[=[
    Represents a connection to the scheduler.

    @class SchedulerJobStepConnection
    @tag Type
]=]
local SchedulerJobStepConnection = {}

--[=[
        If true, this connection is being actively fired, otherwise it was disconnected.

        @prop IsConnected boolean
        @within SchedulerJobStepConnection
        @readonly
    ]=]
SchedulerJobStepConnection.IsConnected = true

--[=[
        If true, this connection can be fired, otherwise it was temporarily disabled with `:Disable()`

        @prop IsEnabled boolean
        @within SchedulerJobStepConnection
        @readonly
    ]=]
SchedulerJobStepConnection.IsEnabled = true

--[=[
        Enables the connection to be fired, if disabled with `:Disable()`

        @within SchedulerJobStepConnection
    ]=]
function SchedulerJobStepConnection:Enable(): ()
	return nil
end

--[=[
        Prevents this connection from being temporarily fired, can be re-enabled with `:Enable()`

        @within SchedulerJobStepConnection
    ]=]
function SchedulerJobStepConnection:Disable(): ()
	return nil
end

--[=[
        Disconnects this connection which stops it from being fired.
        This will make this connection unusable in the future.

        @within SchedulerJobStepConnection
    ]=]
function SchedulerJobStepConnection:Disconnect(): ()
	return nil
end
