const server = require("http").createServer();
const io = require("socket.io")(server);
const axios = require("axios");

const axiosClient = axios.create({
  baseURL: "http://10.10.244.44:3000/",
});

const chatMessage = "chatMessages";

io.on("connection", function (client) {
  console.log("client connect...", client.id);

  client.on("getInfo", async (userId) => {
    try {
      const serverRes = await axiosClient.get(`${chatMessage}/${userId}`);
      serverRes.data.forEach((message) => {
        const room =
          message.sentUserID < message.recievedUserID
            ? message.sentUserID + message.recievedUserID
            : message.recievedUserID + message.sentUserID;
        client.join(room);
      });

      io.emit("userMessages", serverRes.data);
    } catch (error) {
      console.error(error);
    }
  });

  client.on("sendMessage", async (message) => {
    try {
      const serverRes = await axiosClient.post(`${chatMessage}`, message, {
        headers: {
          "Content-Type": "application/json",
        },
      });

      console.log

      const room =
        message.sentUserID < message.recievedUserID
          ? message.sentUserID + message.recievedUserID
          : message.recievedUserID + message.sentUserID;
      io.to(room).emit("newMessage", message);
    } catch (error) {
      console.error(error);
    }
  });

  client.on("disconnect", function () {
    console.log("client disconnect...", client.id);
    // handleDisconnect()
  });

  client.on("error", function (err) {
    console.log("received error from client:", client.id);
    console.log(err);
  });
});

var server_port = 3000;
server.listen(server_port, "10.10.244.48", function (err) {
  if (err) throw err;
  console.log("Listening on port %d", server_port);
});