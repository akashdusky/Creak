import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          shadowColor: Colors.deepOrange,
          elevation: 8,
          shape: Border(right: BorderSide(color: Colors.deepOrange, width: 5)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 5, bottom: 20),
                child: Text(
                  "Hey  i hate this ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text("23:58",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all_outlined,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
