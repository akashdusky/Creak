import 'package:creakchat/model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key key, this.contact}) : super(key: key);

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Container(
          height: 50,
          width: 55,
          child: Stack(children: [
            CircleAvatar(
              backgroundColor: Colors.deepOrange[400],
              radius: 23,
              child: SvgPicture.asset(
                "assets/api.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
            contact.select
                ? Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                : Container()
          ]),
        ),
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.status,
          style: TextStyle(fontSize: 17, color: Colors.grey[600]),
        ),
      ),
    );
  }
}
