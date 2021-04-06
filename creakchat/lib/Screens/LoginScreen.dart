import 'package:creakchat/CustomUI/ButtonCard.dart';
import 'package:creakchat/Screens/Homescreen.dart';
import 'package:creakchat/model/ChatModel.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel sourceChat;
  List<ChatModel> chats = [
    ChatModel(
        currentMessage: "i made sick art",
        name: "Creator",
        isGroup: false,
        time: "12:69",
        id: 0,
        icon: "poly.svg"),
    ChatModel(
        currentMessage: "im scared",
        name: "Superman",
        isGroup: false,
        time: "9:19",
        id: 1,
        icon: "poly.svg"),
    ChatModel(
        currentMessage: "me and henry canvil had sex",
        name: "Zack synder",
        isGroup: false,
        time: "11:19",
        id: 2,
        icon: "api.svg"),
    ChatModel(
        currentMessage: "COME HOME RIGHT NOW",
        name: "Black widow",
        isGroup: false,
        time: "10:19",
        id: 3,
        icon: "api.svg"),
    ChatModel(
        currentMessage: "Nobody is home",
        name: "Hulk",
        isGroup: false,
        time: "69:99",
        id: 4,
        icon: "api.svg"),
    ChatModel(
        currentMessage: "Sold the PETN",
        name: "Rick Sanchez",
        isGroup: false,
        time: "69:99",
        id: 5,
        icon: "api.svg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            sourceChat = chats.removeAt(index);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (builder) => Homescreen(
                    chatmodels: chats,
                    sourceChat: sourceChat,
                  ),
                ));
          },
          child: ButtonCard(
            name: chats[index].name,
            icon: Icons.person,
          ),
        ),
      ),
    );
  }
}
