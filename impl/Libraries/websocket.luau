--[=[
    Provides functions for interacting with WebSocket servers.
    @class websocket
    @tag Library
]=]
local websocket = {}

--[=[
    Establishes a connection to a WebSocket server.

    This function initiates the connection attempt and yields the current thread until the connection is established or fails. The connection attempt times out after 30 seconds.

    @within websocket
    @yields
    @param url string -- The WebSocket URL to connect to (must start with `ws://` or `wss://`).
    @return WebSocketConnection? -- The `WebSocketConnection` object on success, or `nil` if the connection failed (e.g., invalid URL, timeout, server unreachable).
    @error invalid websocket url -- The provided URL does not start with `ws://` or `wss://`.

    :::tip Usage
    ```lua
    local wsUrl = "wss://echo.websocket.org" -- Example echo server
    local connection = websocket.connect(wsUrl)

    if connection then
        print("WebSocket connected!")

        connection.OnMessage:Connect(function(message)
            print("Received:", message)
            -- Echo the message back after 1 second
            task.delay(1, function()
                connection:Send("Echo: " .. message)
            end)
        end)

        connection.OnClose:Connect(function()
            print("WebSocket disconnected.")
        end)

        -- Send an initial message
        connection:Send("Hello from Luau!")

        -- Close after 10 seconds
        task.delay(10, function()
            print("Closing connection...")
            connection:Close()
        end)
    else
        print("WebSocket connection failed for:", wsUrl)
    end
    ```
    :::
]=]
function websocket.connect(url: string): WebSocketConnection?
    return nil :: any
end

return websocket
