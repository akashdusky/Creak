import 'package:creakchat/CustomUI/CustomCard.dart';
import 'package:creakchat/Screens/SelectContact.dart';
import 'package:creakchat/model/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        currentMessage: "i made sick art",
        name: "chungus",
        isGroup: false,
        time: "12:69",
        icon: "poly.svg"),
    ChatModel(
        currentMessage: "server 404# erro",
        name: "Creak admin server",
        isGroup: true,
        time: "12:69",
        icon: "api.svg"),
    ChatModel(
        currentMessage: "im scared",
        name: "jake paul",
        isGroup: false,
        time: "9:19",
        icon: "poly.svg"),
    ChatModel(
        currentMessage: "new kotlin binaries out",
        name: "kotlin group",
        isGroup: true,
        time: "12:69",
        icon: "api.svg"),
    ChatModel(
        currentMessage: "me and henry canvil had sex",
        name: "Zack synder",
        isGroup: false,
        time: "11:19",
        icon: "api.svg"),
    ChatModel(
        currentMessage: "COME HOME RIGHT NOW",
        name: "Mom",
        isGroup: false,
        time: "10:19",
        icon: "api.svg"),
    ChatModel(
        currentMessage: "Nobody is home",
        name: "Selena",
        isGroup: false,
        time: "69:99",
        icon: "api.svg"),
    ChatModel(
        currentMessage: "Sold the PETN",
        name: "Rick Sanchez",
        isGroup: false,
        time: "69:99",
        icon: "api.svg"),
    ChatModel(
        currentMessage: "Sheldon is dead",
        name: "Penny",
        isGroup: false,
        time: "69:99",
        icon: "api.svg"),
    ChatModel(
        currentMessage: "assigngments pending",
        name: "Art Teacher",
        isGroup: false,
        time: "69:99",
        icon: "api.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.change_history),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return SelectContact();
            }));
          },
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return CustomCard(
                chatModel: chats[index],
              );
            }));
  }
}
