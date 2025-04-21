--[=[
    Represents metadata properties of a file.

    @class ItemProperties
    @tag Type
]=]
local ItemProperties = {}

--[=[
    The size of the file in bytes.

    @prop Size number
    @within ItemProperties
    @readonly
]=]
ItemProperties.Size = 0

--[=[
    The time the file was created, typically as a Unix timestamp (seconds since epoch).

    @prop CreationTime number
    @within ItemProperties
    @readonly
]=]
ItemProperties.CreationTime = 0

--[=[
    The time the file was last modified, typically as a Unix timestamp (seconds since epoch).

    @prop LastModifiedTime number
    @within ItemProperties
    @readonly -- Usually updated by the OS on writes, direct setting might not be reliable/supported.
]=]
ItemProperties.LastModifiedTime = 0

--[=[
    Indicates if the file is marked as hidden by the operating system.

    @prop IsHidden boolean
    @within ItemProperties
    -- Settable via `setproperties`
]=]
ItemProperties.IsHidden = false

--[=[
    Indicates if the file is marked as read-only by the operating system.

    @prop IsReadOnly boolean
    @within ItemProperties
    -- Settable via `setproperties`
]=]
ItemProperties.IsReadOnly = false

return ItemProperties