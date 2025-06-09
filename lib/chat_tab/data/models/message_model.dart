import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String id;
  final String content;
  final DateTime dateTime;
  final String senderId;
  final String senderName;
  final String chatId;

  MessageModel({
    this.id = '',
    required this.content,
    required this.dateTime,
    required this.senderId,
    required this.senderName,
    required this.chatId,
  });

  // MessageModel.fromJson(Map<String, dynamic> json)
  //     : this(
  //         id: json['id'],
  //         content: json['content'],
  //         dateTime: (json['dateTime'] as Timestamp).toDate(),
  //         senderId: json['senderId'],
  //         senderName: json['senderName'],
  //         chatId: json['chatId'],
  //       );

  MessageModel.fromJson(Map<String, dynamic>? json)
      : this(
          id: json?['id'] ?? '',
          content: json?['content'] ?? '',
          dateTime:
              (json?['dateTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
          senderId: json?['senderId'] ?? '',
          senderName: json?['senderName'] ?? '',
          chatId: json?['chatId'] ?? '',
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'dateTime': FieldValue.serverTimestamp(),
        'senderId': senderId,
        'senderName': senderName,
        'chatId': chatId,
      };
}
