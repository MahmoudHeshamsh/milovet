//////////////////////////////////////////

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:milovet/chat_tab/data/models/message_model.dart';
import 'package:milovet/chat_tab/view_model/chat_state.dart';
import 'package:milovet/models/user_model.dart';
import 'package:milovet/shared/firebase_functions.dart';

class ChatViewModel extends Cubit<ChatState> {
  ChatViewModel() : super(ChatInitial());
  final TextEditingController messageControllerr = TextEditingController();
  late UserModel currentUser;
  late String chatId;
  bool isInitialized = false;

  Future<void> sendMessage({
    required String content,
    required String chatId,
    required UserModel sender,
  }) async {
    if (content.isEmpty) return;
    emit(SendMessageLoading());
    try {
      final message = MessageModel(
        content: content,
        dateTime: DateTime.now(),
        chatId: chatId,
        senderId: sender.id,
        senderName: sender.name,
      );

      messageControllerr.clear();

      await FirebaseFunctions.insertMessageToChat(message);

      emit(SendMessageSuccess());
    } catch (error) {
      emit(SendMessageError());
    }
  }

  // Future<void> sendMessage(MessageModel message) async {
  //   emit(SendMessageLoading());
  //   try {
  //     await FirebaseFunctions.insertMessageToChat(message);
  //     emit(SendMessageSuccess());
  //   } catch (error) {
  //     emit(SendMessageError());
  //   }
  // }

  Future<void> getMessagesStream(String chatId) async {
    emit(GetMessagesStreamLoading());
    try {
      final messageStream = FirebaseFunctions.getChatMessages(chatId);
      emit(GetMessagesStreamSuccess(messageStream));
    } catch (error) {
      emit(GetMessagesStreamError());
    }
  }

  bool isMyMessage(String senderId) => senderId == currentUser.id;

  @override
  Future<void> close() {
    messageControllerr.dispose();
    return super.close();
  }
}
