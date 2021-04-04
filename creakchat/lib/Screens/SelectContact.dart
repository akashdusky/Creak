import 'package:creakchat/CustomUI/ButtonCard.dart';
import 'package:creakchat/CustomUI/ContactCard.dart';
import 'package:creakchat/Screens/createGroup.dart';
import 'package:creakchat/model/ChatModel.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  List<ChatModel> contacts = [
    ChatModel(name: "mom", status: 'gg mom'),
    ChatModel(name: "Balram", status: 'developer'),
    ChatModel(name: "Lima", status: 'slaker'),
    ChatModel(name: "Dimitri", status: 'bullied kid'),
    ChatModel(name: "hawk", status: '=the bully'),
    ChatModel(name: "Carlito", status: 'WWE'),
    ChatModel(name: "mom", status: 'gg mom'),
    ChatModel(name: "Balram", status: 'developer'),
    ChatModel(name: "Lima", status: 'slaker'),
    ChatModel(name: "Dimitri", status: 'bullied kid'),
    ChatModel(name: "hawk", status: '=the bully'),
    ChatModel(name: "Carlito", status: 'WWE'),
    ChatModel(name: "mom", status: 'gg mom'),
    ChatModel(name: "Balram", status: 'developer'),
    ChatModel(name: "Lima", status: 'slaker'),
    ChatModel(name: "Dimitri", status: 'bullied kid'),
    ChatModel(name: "hawk", status: '=the bully'),
    ChatModel(name: "Carlito", status: 'WWE'),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Search connection",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text("30" + "  Cons"),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  size: 26,
                )),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Invite a friend'),
                  value: 'Invite a friendt',
                ),
                PopupMenuItem(
                  child: Text('Contacts'),
                  value: 'Contact',
                ),
                PopupMenuItem(
                  child: Text('Refresh'),
                  value: 'Refresh',
                ),
                PopupMenuItem(
                  child: Text('Help'),
                  value: 'Help',
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.person,
                    name: "Create creed",
                  ),
                );
              } else if (index == 1) {
                return ButtonCard(
                  icon: Icons.speaker,
                  name: "Add Connection",
                );
              }
              return ContactCard(
                contact: contacts[index - 2],
              );
            }));
  }
}
