import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPageScreen extends StatelessWidget {
  const ChatPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {"text": "Hello, How can I help you?", "isMe": false},
      {"text": "Lorem ipsum dolor sit amet,", "isMe": true},
      {
        "text":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nonummy nibh",
        "isMe": false
      },
      {"text": "Lorem ipsum dolor sit amet,", "isMe": true},
      {
        "text":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nonummy nibh",
        "isMe": false
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple),
          onPressed: () {},
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/image.png"), // صورة البروفايل
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
                    SizedBox(width: 5),
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Row(
                  mainAxisAlignment: message["isMe"]
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (!message["isMe"])
                      CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/image.png")),
                    SizedBox(
                      width: 10.w,
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(12),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      decoration: BoxDecoration(
                        color:
                            message["isMe"] ? Colors.purple : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        message["text"],
                        style: TextStyle(
                          color: message["isMe"] ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
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
                    decoration: InputDecoration(
                      hintText: "message",
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(
                            5), // مسافة صغيرة عشان يكون مظبوط جوه
                        child: CircleAvatar(
                          backgroundColor: Colors.purple,
                          child: IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: IconButton(
                    icon: Image.asset('assets/images/Send 2.png',
                        width: 24.w, height: 24.h),
                    onPressed: () {
                      // وظيفة الإرسال هنا
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
