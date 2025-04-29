--[=[
    Represents an active WebSocketConnection connection.

    This object is returned by `websocket.connect` upon a successful connection. It allows sending messages and listening for incoming messages and closure events.

    @class WebSocketConnection
    @tag Type
]=]
local WebSocketConnection = {}

--[=[
    An RBXScriptSignal that fires when a message is received from the WebSocketConnection server.

    @prop OnMessage RBXScriptSignal<string>
    @within WebSocketConnection
    @readonly

    :::tip Connecting
    ```lua
    local webSocket = websocket.connect("wss://example.com")
    if webSocket then
        webSocket.OnMessage:Connect(function(message)
            print("Received message:", message)
        end)
    end
    ```
    :::
]=]
WebSocketConnection.OnMessage = nil :: any

--[=[
    An RBXScriptSignal (effectively `BindableEvent.Event`) that fires when the WebSocketConnection connection is closed, either initiated by the server, the client (`:Close()`), or due to an error.

    @prop OnClose RBXScriptSignal
    @within WebSocketConnection
    @readonly

    :::tip Connecting
    ```lua
    local webSocket = websocket.connect("wss://example.com")
    if webSocket then
        webSocket.OnClose:Connect(function()
            print("WebSocketConnection connection closed")
        end)
    end
    ```
    :::
]=]
WebSocketConnection.OnClose = nil :: any

--[=[
    The URL of the websocket connection.

    @prop URL string
    @within WebSocketConnection
    @readonly
]=]
WebSocketConnection.Url = "wss://rbxstu.dev/"

--[=[
    Sends a string message over the WebSocketConnection connection.

    If the connection is not currently open (e.g., it's connecting, closed, or closing), this method does nothing.

    @within WebSocketConnection
    @param message string -- The message to send.
]=]
function WebSocketConnection:Send(message: string): ()
    return nil
end

--[=[
    Closes the WebSocketConnection connection.

    This will trigger the `OnClose` event asynchronously. If the connection is already closed or closing, this method does nothing.

    @within WebSocketConnection
]=]
function WebSocketConnection:Close(): ()
    return nil
end

return WebSocketConnection
