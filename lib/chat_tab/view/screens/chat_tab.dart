import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/auth/view/screens/auth_view_model.dart';
import 'package:milovet/chat_tab/data/models/message_model.dart';
import 'package:milovet/chat_tab/view/widgets/sent_message.dart';
import 'package:milovet/chat_tab/view_model/chat_state.dart';
import 'package:milovet/chat_tab/view_model/chat_view_model.dart';
import 'package:milovet/models/user_model.dart';
import '../widgets/recieved_message.dart';

//////////////////////////////////////

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final viewModel = ChatViewModel();
  List<MessageModel> messages = [];
  // final scrollController = ScrollController();

  final messageControllerr = TextEditingController();

  late final String chatId;
  late final UserModel currentUser;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      chatId = args['chatId'] as String;
      viewModel.chatId = chatId;
      viewModel.currentUser =
          BlocProvider.of<AuthViewModel>(context).currentUser!;
      viewModel.isInitialized = true;
      currentUser = viewModel.currentUser;
      viewModel.getMessagesStream(chatId);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> messages = [
    //   // {"text": "Hello, How can I help you?", "isMe": false},
    //   // {"text": "Lorem ipsum dolor sit amet,", "isMe": true},
    //   // {
    //   //   "text":
    //   //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nonummy nibh",
    //   //   "isMe": false
    //   // },
    //   // {"text": "Lorem ipsum dolor sit amet,", "isMe": true},
    //   // {
    //   //   "text":
    //   //       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nonummy nibh",
    //   //   "isMe": false
    //   // },
    // ];
    // final TextEditingController _controller = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6F3797)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/image.png"),
            ),
            SizedBox(width: 10.w),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("DR: Mostafa Mohamed",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Row(
                    children: [
                      Icon(Icons.circle, size: 10.sp, color: Colors.green),
                      const SizedBox(width: 5),
                      Text("Active",
                          style: TextStyle(
                              fontSize: 12.sp, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatViewModel, ChatState>(
              bloc: viewModel,
              buildWhen: (previousState, currentState) =>
                  currentState is GetMessagesStreamLoading ||
                  previousState is GetMessagesStreamLoading,
              builder: (context, state) {
                if (state is GetMessagesStreamLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetMessagesStreamError) {
                  return const Center(child: Text('Error loading messages'));
                } else if (state is GetMessagesStreamSuccess) {
                  return StreamBuilder<List<MessageModel>>(
                    stream: state.stream,
                    builder: (context, snapshot) {
                      // if (!snapshot.hasData) {
                      //   return const Center(child: CircularProgressIndicator());
                      // }
                      if (snapshot.hasData) {
                        messages = snapshot.data!.reversed.toList();
                        // scrollController.animateTo(
                        //   scrollController.position.maxScrollExtent,
                        //   duration: Duration(microseconds: 200),
                        //   curve: Curves.linear,
                        // );
                      }

                      return ListView.builder(
                        // controller: ScrollController(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          final isMyMessage = viewModel.isMyMessage(
                            message.senderId,
                          );

                          if (isMyMessage) {
                            return SentMessage(
                              message: message,
                              currentUser: currentUser,
                            );
                          } else {
                            return RecievedMessage(
                              message: message,
                              currentUser: currentUser,
                            );
                          }
                        },
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: viewModel.messageControllerr,
                    decoration: InputDecoration(
                      hintText: "message",
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(5),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF6F3797),
                          child: IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  backgroundColor: const Color(0xFF6F3797),
                  child: IconButton(
                    icon: Image.asset('assets/images/Send 2.png',
                        width: 24.w, height: 24.h),
                    // onPressed: () => viewModel.sendMessage(MessageModel(content:viewModel.messageControllerr.text ,chatId:chatId ,dateTime: DateTime.now() ,senderId:currentUser.id ,senderName:currentUser.name ,)),
                    onPressed: () {
                      if (viewModel.messageControllerr.text.trim().isNotEmpty &&
                          chatId.isNotEmpty &&
                          currentUser.id.isNotEmpty) {
                        viewModel.sendMessage(
                          content: viewModel.messageControllerr.text.trim(),
                          chatId: chatId,
                          sender: currentUser,
                        );
                      } else {
                        debugPrint('chatId or currentUser not ready');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }
}
