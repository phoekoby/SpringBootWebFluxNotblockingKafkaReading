let express = require("express")
let app = express()
let serv = require("http").createServer(app)
const DEBUG = true
const TPS = 1

// HTTP
app.get("/", (req, res) => res.sendFile(__dirname + "/client/index.html"))
app.use("/client", express.static(__dirname + "/client"))

serv.listen(process.env.PORT || 2000)
console.log("Server started")

SOCKET_LIST = {}

// WS
let io = require("socket.io")(serv, {})
io.sockets.on("connection", socket => {
    socket.id = new Date().getTime() % 1000000000
    SOCKET_LIST[socket.id] = socket
    console.log('new connection', socket.id)

    socket.on("disconnect", () => {
        delete SOCKET_LIST[socket.id]
    })
    socket.on("signIn", data => {
        socket.emit("signInResponse", {success: true})
    })
    socket.emit('init', {selfId: socket.id})
})


/*
{"exgausterId":1,"signalType":"analog","comment":"Ток статора эксгаустера №1","active":1,"value":184.259552001953,"moment":1675298847000,"code":"SM_Exgauster\[4:3]"}
 */
setInterval(() => {

    for(let i in SOCKET_LIST){
        const socket = SOCKET_LIST[i]
        socket.emit("update", [
            {"exgausterId":1,"signalType":"analog","comment":"Ток статора эксгаустера №1 1","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[1:1]"},
            {"exgausterId":1,"signalType":"analog","comment":"Ток статора эксгаустера №1 2","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[1:2]"},
            {"exgausterId":1,"signalType":"analog","comment":"Ток статора эксгаустера №1 3","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[1:3]"},
            {"exgausterId":1,"signalType":"analog","comment":"Ток статора эксгаустера №1 4","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[1:4]"},
            {"exgausterId":1,"signalType":"analog","comment":"Ток статора эксгаустера №1 5","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[1:5]"},
            {"exgausterId":1,"signalType":"analog","comment":"Ток статора эксгаустера №1 6","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[1:6]"},
            {"exgausterId":1,"signalType":"analog","comment":"Ток статора эксгаустера №1 7","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[1:7]"},

            {"exgausterId":2,"signalType":"analog","comment":"Ток статора эксгаустера №2 1","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[2:1]"},
            {"exgausterId":2,"signalType":"analog","comment":"Ток статора эксгаустера №2 2","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[2:2]"},
            {"exgausterId":2,"signalType":"analog","comment":"Ток статора эксгаустера №2 3","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[2:3]"},
            {"exgausterId":2,"signalType":"analog","comment":"Ток статора эксгаустера №2 4","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[2:4]"},
            {"exgausterId":2,"signalType":"analog","comment":"Ток статора эксгаустера №2 5","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[2:5]"},
            {"exgausterId":2,"signalType":"analog","comment":"Ток статора эксгаустера №2 6","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[2:6]"},
            {"exgausterId":2,"signalType":"analog","comment":"Ток статора эксгаустера №2 7","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[2:7]"},

            {"exgausterId":3,"signalType":"analog","comment":"Ток статора эксгаустера №3 1","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[3:1]"},
            {"exgausterId":3,"signalType":"analog","comment":"Ток статора эксгаустера №3 2","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[3:2]"},
            {"exgausterId":3,"signalType":"analog","comment":"Ток статора эксгаустера №3 3","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[3:3]"},
            {"exgausterId":3,"signalType":"analog","comment":"Ток статора эксгаустера №3 4","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[3:4]"},
            {"exgausterId":3,"signalType":"analog","comment":"Ток статора эксгаустера №3 5","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[3:5]"},
            {"exgausterId":3,"signalType":"analog","comment":"Ток статора эксгаустера №3 6","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[3:6]"},
            {"exgausterId":3,"signalType":"analog","comment":"Ток статора эксгаустера №3 7","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[3:7]"},

            {"exgausterId":4,"signalType":"analog","comment":"Ток статора эксгаустера №4 1","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[4:1]"},
            {"exgausterId":4,"signalType":"analog","comment":"Ток статора эксгаустера №4 2","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[4:2]"},
            {"exgausterId":4,"signalType":"analog","comment":"Ток статора эксгаустера №4 3","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[4:3]"},
            {"exgausterId":4,"signalType":"analog","comment":"Ток статора эксгаустера №4 4","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[4:4]"},
            {"exgausterId":4,"signalType":"analog","comment":"Ток статора эксгаустера №4 5","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[4:5]"},
            {"exgausterId":4,"signalType":"analog","comment":"Ток статора эксгаустера №4 6","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[4:6]"},
            {"exgausterId":4,"signalType":"analog","comment":"Ток статора эксгаустера №4 7","active":1,"value":Math.random() * 200,"moment":(new Date()).getTime(),"code":"SM_Exgauster\[4:7]"},
        ])
    }

}, 1000 / TPS)