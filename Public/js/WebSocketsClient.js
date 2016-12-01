var ws = new WebSocket("ws://0.0.0.0:8080/ws")

ws.onmessage = function(msg) {
    console.log(msg)
}

ws.onopen = function(event) {
    ws.send("Hello, there!")
}