import 'package:creakchat/Screens/individualpage.dart';
import 'package:creakchat/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualPage(
                      chatModel: chatModel,
                    )));
      },
      onLongPress: () {
        print("long press");
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: SvgPicture.asset(
                chatModel.isGroup ? "assets/api.svg" : "assets/poly.svg",
                color: Colors.white,
                height: 38,
                width: 38,
              ),
              backgroundColor: Colors.deepOrange[200],
            ),
            trailing: Text('12:00'),
            title: Text(
              chatModel.name,
              style: TextStyle(
                  fontFamily: "Quick",
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.done_all_rounded,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  chatModel.currentMessage,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
