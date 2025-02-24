import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> users = [
    {"name": "DR: Mostafa Mohamed", "image": "assets/images/image.png"},
    {"name": "DR: Ahmed Ali", "image": "assets/images/9.jpeg"},
    {"name": "DR: Sara Hassan", "image": "assets/images/4.jpeg"},
    {"name": "DR: Khaled Youssef", "image": "assets/images/10.jpeg"},
    {"name": "DR: Yasmine Adel", "image": "assets/images/5.jpeg"},
    {"name": "DR: Mohamed Samir", "image": "assets/images/11.jpeg"},
    {"name": "DR: Hana Ibrahim", "image": "assets/images/6.jpeg"},
    {"name": "DR: Eman Saeed", "image": "assets/images/7.jpeg"},
    {"name": "DR: Nourhan Hossam", "image": "assets/images/8.jpeg"},
    {"name": "DR: Omar Tarek", "image": "assets/images/12.jpeg"},
  ];

  List<Map<String, String>> filteredUsers = [];
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
            .where((user) =>
                user["name"]!.toLowerCase().contains(query.toLowerCase()))
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
                'assets/images/Group 4273226660.png',
                height: 50.h, // حجم الصورة
                width: 50.h, // تأكدي إنه نفس العرض عشان يكون دائري
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
                          radius: 30.r,
                          backgroundImage:
                              AssetImage(filteredUsers[index]["image"]!),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffDACFE0),
                              minimumSize: Size(double.infinity, 64.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/chatPage');
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 1.h),
                                child: Text(
                                  filteredUsers[index]["name"]!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ChatListScreen extends StatefulWidget {
//   const ChatListScreen({super.key});

//   @override
//   State<ChatListScreen> createState() => _ChatListScreenState();
// }

// class _ChatListScreenState extends State<ChatListScreen> {
//   TextEditingController searchController = TextEditingController();
//   List<String> users =
//       List.generate(10, (index) => "DR: ${index + 1}"); // أسماء المستخدمين
//   List<String> filteredUsers = [];
//   bool isSearching = false;

//   @override
//   void initState() {
//     super.initState();
//     filteredUsers = users;
//   }

//   void filterUsers(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredUsers = users;
//       } else {
//         filteredUsers = users
//             .where((user) => user.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: Row(
//           children: [
//             ClipOval(
//               child: Image.asset(
//                 'assets/images/Group 4273226660.png',
//                 height: 50.h, // حجم الصورة
//                 width: 50.h, // تأكدي إنه نفس العرض عشان يكون دائري
//                 fit: BoxFit.cover, // يضبط الصورة داخل الدائرة
//               ),
//             ),
//             SizedBox(width: 8.w), // مسافة صغيرة بين الصورة والنص
//             const Text(
//               "Milovet",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.white),
//             onPressed: () {
//               // إضافة البحث هنا
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // TextField للبحث يظهر فقط عندما يكون البحث مفعلًا
//           if (isSearching)
//             Padding(
//               padding: EdgeInsets.all(10.h),
//               child: TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   hintText: "Search...",
//                   prefixIcon: const Icon(Icons.search, color: Colors.purple),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 onChanged: filterUsers,
//               ),
//             ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ListView.builder(
//                 itemCount: filteredUsers.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: 12.h),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 30.r,
//                           backgroundImage: AssetImage("assets/images/2.jpeg"),
//                           // backgroundColor:
//                           //     const Color.fromARGB(255, 204, 164, 211),
//                         ),
//                         SizedBox(width: 10.w),
//                         Expanded(
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xffDACFE0),
//                               minimumSize: Size(double.infinity, 64.h),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/chatPage');
//                             },
//                             child: Align(
//                               alignment: Alignment.centerLeft, //
//                               child: Padding(
//                                 padding: EdgeInsets.only(left: 10.w, top: 2.h),
//                                 child: Text(
//                                   filteredUsers[index],
//                                   style: TextStyle(
//                                     color: Colors.purple,
//                                     fontSize: 18.sp,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
