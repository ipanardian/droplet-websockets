# Droplet WebSockets

## Build and Run
```
$ vapor build

$ vapor run
```

## WebSocket Client
We can use javascript
```JS
var ws = new WebSocket("ws://0.0.0.0:8080/ws")

ws.onmessage = function(msg) {
    console.log(msg)
}

ws.onopen = function(event) {
    ws.send("Hello, there!")
}
```

## Screenshot
![screen shot 2016-12-01 at 11 25 30 pm](https://cloud.githubusercontent.com/assets/415225/20858014/36e5802c-b96d-11e6-8c56-24aff2684093.png)
