class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;

  ChatModel(
      {this.currentMessage,
      this.icon,
      this.isGroup,
      this.time,
      this.name,
      this.select = false,
      this.status});
}
