import 'package:creakchat/CustomUI/OwnMessageCard.dart';
import 'package:creakchat/CustomUI/replyCard.dart';
import 'package:creakchat/model/messageModel.dart';
import 'package:emoji_picker/emoji_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../model/ChatModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key key, this.chatModel, this.sourcechat})
      : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourcechat;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool showemoji = false;
  bool sendbutton = false;
  FocusNode focusNode = FocusNode();
  IO.Socket socket;
  TextEditingController _controler = TextEditingController();
  List<MessageModel> messages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showemoji = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io("http://183.82.36.157:5000/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourcechat.id);

    socket.onConnect((data) {
      print("Connected");
      socket.on("message",
          (data) => {print(data), setMessage("destination", data["message"])});
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);
    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/bg.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: InkWell(
              splashColor: Colors.deepOrange,
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: TextStyle(
                          fontSize: 16.5, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Left at 12:09,",
                      style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            leadingWidth: 80,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.arrow_back_ios_outlined),
                  CircleAvatar(
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup
                          ? "assets/api.svg"
                          : "assets/poly.svg",
                      height: 38,
                      width: 38,
                    ),
                    radius: 20,
                    backgroundColor: Colors.white,
                  )
                ],
              ),
            ),
            actions: [
              IconButton(icon: Icon(Icons.videocam_outlined), onPressed: () {}),
              IconButton(icon: Icon(Icons.call_outlined), onPressed: () {}),
              PopupMenuButton(itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('View Profile'),
                    value: 'View Contact',
                  ),
                  PopupMenuItem(
                    child: Text('Shared media'),
                    value: 'Shared mediat',
                  ),
                  PopupMenuItem(
                    child: Text('Marked'),
                    value: 'Marked',
                  ),
                  PopupMenuItem(
                    child: Text('Search'),
                    value: 'Search',
                  ),
                  PopupMenuItem(
                    child: Text('Mute'),
                    value: 'Mute',
                  ),
                ];
              })
            ],
          ),
          body: Container(
            color: Colors.black87,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              onWillPop: () {
                if (showemoji) {
                  setState(() {
                    showemoji = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Stack(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height - 140,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          if (messages[index].type == "source") {
                            return OwnMessageCard(
                              message: messages[index].message,
                            );
                          } else {
                            return ReplyMessageCard(
                                message: messages[index].message);
                          }
                        },
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 10, right: 2, bottom: 21),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        sendbutton = true;
                                      });
                                    } else {
                                      setState(() {
                                        sendbutton = false;
                                      });
                                    }
                                  },
                                  controller: _controler,
                                  focusNode: focusNode,
                                  maxLines: 7,
                                  minLines: 1,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "type here obviously",
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              icon: Icon(
                                                  Icons.attach_file_outlined),
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (_) {
                                                      return bottomSheet();
                                                    });
                                              }),
                                          IconButton(
                                              icon: Icon(Icons.camera),
                                              onPressed: () {}),
                                        ],
                                      ),
                                      prefixIcon: IconButton(
                                        icon:
                                            Icon(Icons.emoji_emotions_rounded),
                                        onPressed: () {
                                          focusNode.unfocus();
                                          focusNode.canRequestFocus = false;
                                          setState(() {
                                            showemoji = !showemoji;
                                          });
                                        },
                                      ),
                                      contentPadding: EdgeInsets.all(7)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 21, right: 5, left: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                radius: 25,
                                child: IconButton(
                                  onPressed: () {
                                    if (sendbutton) {
                                      sendMessage(
                                          _controler.text,
                                          widget.sourcechat.id,
                                          widget.chatModel.id);
                                      _controler.clear();
                                    }
                                  },
                                  icon: Icon(
                                    sendbutton ? Icons.send : Icons.mic,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        showemoji ? emojiSelect() : Container()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {
        print(text);
      },
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 30,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(text)
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.camera_alt_rounded, Colors.pink, "Camera"),
                  SizedBox(width: 40),
                  iconcreation(Icons.insert_drive_file, Colors.indigo, "Docs"),
                  SizedBox(width: 40),
                  iconcreation(Icons.image_outlined, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.audiotrack, Colors.deepOrange, "Audio"),
                  SizedBox(width: 40),
                  iconcreation(Icons.location_on, Colors.green, "Location"),
                  SizedBox(width: 40),
                  iconcreation(Icons.person, Colors.cyan, "Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, catergory) {
          print(emoji);
          setState(() {
            _controler.text = _controler.text + emoji.emoji;
          });
        });
  }
}
