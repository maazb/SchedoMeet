class ChatModel {
  int? id;
  String? message;
  List<String>? images;
  bool? sender;
  DateTime? date;
  String? senderName;
  bool? haveImage;

  ChatModel(
      {this.id,
      this.message,
      this.images,
      this.date,
      this.sender,
      this.senderName,
      this.haveImage});
}
