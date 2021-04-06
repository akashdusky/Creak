import 'package:flutter/material.dart';

class ReplyMessageCard extends StatelessWidget {
  final String message;
  ReplyMessageCard({this.message});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          shadowColor: Colors.purple,
          elevation: 8,
          shape: Border(left: BorderSide(color: Colors.purple, width: 5)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 5, bottom: 20),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text("23:58",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
