--!strict

--[=[
    @class asm
    @tag Library
]=]
local asm = {}

--[=[
    This function compiles the source assembly allowing for full access over the client.
        
    @within asm
    @tag Optional
    @return () -> () -- The compiled assembly as a CClosure

    :::info Format
    This function must follow the same format as MASM files.
    :::
]=]
function asm.compile(source: string): () -> ()
    
end


return asm
