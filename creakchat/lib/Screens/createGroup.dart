import 'package:creakchat/CustomUI/AvatarCard.dart';

import 'package:creakchat/CustomUI/ContactCard.dart';
import 'package:creakchat/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "mom", status: 'gg mom'),
    ChatModel(name: "Rick sanchez", status: 'developer'),
    ChatModel(name: "Lima", status: 'slaker'),
    ChatModel(name: "Dimitri", status: 'bullied kid'),
    ChatModel(name: "hawk", status: '=the bully'),
    ChatModel(name: "Carlito", status: 'WWE'),
  ];

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "New Creed",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add Members",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                size: 26,
              )),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (contacts[index - 1].select == true) {
                        groups.remove(contacts[index - 1]);
                        contacts[index - 1].select = false;
                      } else {
                        groups.add(contacts[index - 1]);
                        contacts[index - 1].select = true;
                      }
                    });
                  },
                  child: ContactCard(
                    contact: contacts[index - 1],
                  ),
                );
              }),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          {
                            if (contacts[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    groups.remove(contacts[index]);
                                    contacts[index].select = false;
                                  });
                                },
                                child: AvatarCard(
                                  contact: contacts[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }
                        },
                      ),
                    ),
                    Divider(thickness: 1),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
