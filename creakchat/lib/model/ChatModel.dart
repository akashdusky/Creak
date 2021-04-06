class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  int id;
  String status;
  bool select = false;

  ChatModel(
      {this.currentMessage,
      this.icon,
      this.isGroup,
      this.id,
      this.time,
      this.name,
      this.select = false,
      this.status});
}
