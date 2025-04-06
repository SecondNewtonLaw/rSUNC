--[=[
    @class rSUNCHttpResponse
    @tag Type
]=]
local rSUNCHttpResponse = {}

--[=[
    The response of the HTTP Server.

    @prop Body string
    @within rSUNCHttpResponse
]=]
rSUNCHttpResponse.Body = "" :: string

--[=[
    A string representation of the `StatusCode` property.    

    @prop StatusMessage string
    @within rSUNCHttpResponse
]=]
rSUNCHttpResponse.StatusMessage = "GET"

--[=[
    The Http Status Code of the request.

    @prop StatusCode number
    @within rSUNCHttpResponse
]=]
rSUNCHttpResponse.StatusCode = 0 :: number

--[=[
    Table of HTTP headers.

    @prop Headers { [string]: string }
    @within rSUNCHttpResponse
]=]
rSUNCHttpResponse.Headers = {}

--[=[
    Whether the request was successful.
    
    @prop Success boolean
    @within rSUNCHttpResponse
]=]
rSUNCHttpResponse.Success = false

return rSUNCHttpResponse
