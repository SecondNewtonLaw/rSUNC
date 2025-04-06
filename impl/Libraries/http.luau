--[=[
    Library used to interact with the HTTP protocol.

    @class http
    @tag Library
]=]
local http = {}


type rSUNCHttpResponse = {
    Body: string,
    Headers: { [string]: string },
    StatusCode: number,
    StatusMessage: string,
    Success: boolean,
}

--[=[
    Performs an HTTP request with the given options, providing the given response

    @param options rSUNCHttpRequest -- The parameters for the http request.
    @return rSUNCHttpResponse -- A response to the rSUNCHttpRequest.
    @within http
    @yields

    :::tip Headers
    By default, this function attaches the following headers:

        {ExecutorName}-User-Identifier	-- A string unique to each user, and does not change if the script executor is used across computers, useful to check if a user is the same, regardless of computer.

        {ExecutorName}-Fingerprint      -- The hardware identifier of the user, useful to check if the user is using the same computer.

        User-Agent                      -- The name and version of the executor.

    :::
]=]
function http.request(options: rSUNCHttpRequest): rSUNCHttpResponse
    return nil :: any
end

return http
