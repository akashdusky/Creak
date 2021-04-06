import 'package:creakchat/CustomUI/CustomCard.dart';
import 'package:creakchat/Screens/SelectContact.dart';
import 'package:creakchat/model/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final List<ChatModel> chatmodels;
  final ChatModel sourceChat;
  ChatPage({this.chatmodels, this.sourceChat});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [];
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
            itemCount: widget.chatmodels.length,
            itemBuilder: (context, index) {
              return CustomCard(
                sourcechat: widget.sourceChat,
                chatModel: widget.chatmodels[index],
              );
            }));
  }
}
