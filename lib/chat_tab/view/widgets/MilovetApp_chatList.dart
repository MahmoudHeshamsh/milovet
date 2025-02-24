import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatList> {
  TextEditingController searchController = TextEditingController();
  List<String> users = List.generate(10, (index) => "User${index + 1}");
  List<String> filteredUsers = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    filteredUsers = users;
  }

  void filterUsers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredUsers = users;
      } else {
        filteredUsers = users
            .where((user) => user.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/Group 427322660.png',
                height: 40.h, // حجم الصورة
                width: 40.h, // تأكدي إنه نفس العرض عشان يكون دائري
                fit: BoxFit.cover, // يضبط الصورة داخل الدائرة
              ),
            ),
            SizedBox(width: 8.w), // مسافة صغيرة بين الصورة والنص
            const Text(
              "Milovet",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // إضافة البحث هنا
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // TextField للبحث يظهر فقط عندما يكون البحث مفعلًا
          if (isSearching)
            Padding(
              padding: EdgeInsets.all(10.h),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search, color: Colors.purple),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: filterUsers,
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24.r,
                          backgroundImage: AssetImage("assets/images/2.jpeg"),
                          // backgroundColor:
                          //     const Color.fromARGB(255, 204, 164, 211),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              minimumSize: Size(double.infinity, 64.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/chatPage');
                            },
                            child: Text(
                              filteredUsers[index],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
