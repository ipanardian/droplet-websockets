/**
* Droplet WebSockets
* 2016 Ipan Ardian
*
* https://github.com/ipanardian/droplet-websockets
*/

import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.socket("ws") { req, ws in
    print("New WebSocket connected: \(ws)")

    try background {
        while ws.state == .open {
            try? ws.ping()
            drop.console.wait(seconds: 10) 
        }
    }

    ws.onText = { ws, text in
        print("Text received: \(text)")

        let rev = String(text.characters.reversed())
        try ws.send(rev)
    }

    ws.onClose = { ws, code, reason, clean in
        print("Closed.")
    }
}

drop.run()