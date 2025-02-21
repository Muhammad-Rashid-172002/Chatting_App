import 'package:flutter/material.dart';
import 'package:chatting_app/Models/Person_Chatting_Screen/Chatting_Screen1.dart';
import 'package:chatting_app/Models/Person_Chatting_Screen/chatting_Screen2.dart';
import 'package:chatting_app/Models/Person_Chatting_Screen/chatting_Screen3.dart';
import 'package:chatting_app/Models/Person_Chatting_Screen/chatting_Screen4.dart';
import 'package:chatting_app/Models/Person_Chatting_Screen/chatting_Screen5.dart';
import 'package:chatting_app/Models/Person_Chatting_Screen/chatting_Screen6.dart';
import 'package:chatting_app/Models/Person_Chatting_Screen/chatting_Screen7.dart';
import 'package:chatting_app/Models/Person_Chatting_Screen/chatting_Screen8.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({super.key});

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  int currentIndex = 0;
  List pages = [
    Profile_Screen(),
    Chatting_Screen(),
    Setting_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chatting'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white12,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class Setting_Screen extends StatelessWidget {
  const Setting_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings Screen"),
    );
  }
}

class Chatting_Screen extends StatefulWidget {
  @override
  State<Chatting_Screen> createState() => _Chatting_ScreenState();
}

class _Chatting_ScreenState extends State<Chatting_Screen> {
  final List<Map<String, dynamic>> contacts = [
    {
      'title': 'Johon Doe',
      'image': 'assets/images/1 (1).jpeg',
      'page': ChattingScreen1()
    },
    {
      'title': 'Abrar Khan',
      'image': 'assets/images/1 (1).jpg',
      'page': ChattingScreen2()
    },
    {
      'title': 'Salman Khan',
      'image': 'assets/images/1 (2).jpeg',
      'page': ChattingScreen3()
    },
    {
      'title': 'Akram Shah',
      'image': 'assets/images/1 (2).jpg',
      'page': ChattingScreen4()
    },
    {
      'title': 'Bilal Ahmad',
      'image': 'assets/images/1 (3).jpeg',
      'page': ChattingScreen5()
    },
    {
      'title': 'Abbas Afridi',
      'image': 'assets/images/1 (4).jpeg',
      'page': ChattingScreen6()
    },
    {
      'title': 'M.Yamaan',
      'image': 'assets/images/2 (1).jpg',
      'page': ChattingScreen7()
    },
    {
      'title': 'M.Rashid',
      'image': 'assets/images/2 (2).jpg',
      'page': ChattingScreen8()
    },
  ];

  TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = List.from(contacts);
  }

  void _searchName(String input) {
    setState(() {
      if (input.isEmpty) {
        filteredContacts = List.from(contacts);
      } else {
        filteredContacts = contacts
            .where((contact) =>
                contact['title'].toLowerCase().contains(input.toLowerCase()))
            .toList();

        if (filteredContacts.isEmpty) {
          filteredContacts = [
            {'title': 'Not Found', 'image': null, 'page': null}
          ];
        }
      }
    });
  }

  final List<String> times = [
    '2:00 AM',
    '4:30 PM',
    '7:10 AM',
    '9:22 AM',
    '9:00 AM',
    '4:33 PM',
    '7:45 AM',
    '10:00 AM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _searchName,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                if (filteredContacts[index]['title'] == "Not Found") {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Not Found",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }

                return ListTile(
                  leading: filteredContacts[index]['image'] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            filteredContacts[index]['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
                  title: Text(
                    filteredContacts[index]['title'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('What is the condition of the product?'),
                  trailing: Text(
                    times[index % times.length],
                    style: TextStyle(color: Colors.grey),
                  ),
                  onTap: () {
                    if (filteredContacts[index]['page'] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => filteredContacts[index]['page'],
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Profile Screen"),
    );
  }
}
