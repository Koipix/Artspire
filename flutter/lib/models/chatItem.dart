class ChatItem {
  final String username;
  final String latestMsg;
  final String imgPath;
  final bool isRequested;

  ChatItem({
    required this.username,
    required this.latestMsg,
    required this.isRequested,
    required this.imgPath,
  });
}
