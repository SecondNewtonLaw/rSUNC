--[=[
    @class rSUNCHttpRequest
    @tag Type
]=]
local rSUNCHttpRequest = {}
--[=[
    The URL to send the request to

    @prop Url string
    @within rSUNCHttpRequest
]=]
rSUNCHttpRequest.Url = "" :: string

--[=[
    The HTTP method this request needs to be done with
    @prop Method "GET" | "POST" | "PATCH" | "PUT" | "DELETE"
    @within rSUNCHttpRequest
]=]
rSUNCHttpRequest.Method = "GET"

--[=[
    The body of the HTTP request. May be empty.
    @prop Body string?
    @within rSUNCHttpRequest
]=]
rSUNCHttpRequest.Body = nil :: string?

--[=[
    Table of HTTP headers.

    @prop Headers { [string]: string }
    @within rSUNCHttpRequest
]=]
rSUNCHttpRequest.Headers = {}

--[=[
    Table of Cookies.
    
    @prop Cookies { [string]: string }
    @within rSUNCHttpRequest
]=]
rSUNCHttpRequest.Cookies = {}

return rSUNCHttpRequest
