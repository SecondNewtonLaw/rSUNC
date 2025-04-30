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
    The time the file was created, typically as a DateTime Object.

    @prop CreationTime DateTime
    @within ItemProperties
    @readonly
]=]
ItemProperties.CreationTime = DateTime.now()

--[=[
    The time the file was last modified, typically as a DateTime Object.

    @prop LastModifiedTime DateTime
    @within ItemProperties
    @readonly -- Usually updated by the OS on writes, direct setting might not be reliable/supported.
]=]
ItemProperties.LastModifiedTime = DateTime.now()

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