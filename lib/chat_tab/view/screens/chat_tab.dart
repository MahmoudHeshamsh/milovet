import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:milovet/chat_tab/view/widgets/sent_message.dart';

import '../widgets/recieved_message.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF6F3797)),
          onPressed: () {},
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/image.png"),
            ),
            SizedBox(width: 10.w),
            Column(
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
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: message["isMe"]
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!message["isMe"])
                        const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/image.png")),
                      SizedBox(
                        width: 10.w,
                        height: 10.h,
                      ),
                      message["isMe"]
                          ? SentMessage(text: message["text"])
                          : RecievedMessage(text: message["text"]),
                      // Container(
                      //     margin: const EdgeInsets.symmetric(vertical: 5),
                      //     padding: const EdgeInsets.all(12),
                      //     constraints: BoxConstraints(
                      //         maxWidth: MediaQuery.of(context).size.width * 0.7),
                      //     decoration: BoxDecoration(
                      //       color: message["isMe"]
                      //           ? const Color(0xFF6F3797)
                      //           : Colors.grey[300],
                      //       borderRadius: BorderRadius.circular(15),
                      //     ),
                      //     child: Column(
                      //       children: [SentMassage(),ResievedMessage()],
                      //     )
                      //     // Text(
                      //     // message["text"],
                      //     // style: TextStyle(
                      //     //   color: message["isMe"] ? Colors.white : Colors.black,
                      //     // ),
                      //     //),
                      //     ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
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
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        setState(() {
                          messages.add({
                            "text": _controller.text.trim(),
                            "isMe": true,
                          });
                          _controller.clear();
                        });
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
}
