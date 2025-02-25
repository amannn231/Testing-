// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test_app/screens/ChatPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List menuItems = [
    "New Group",
    "New Broadcast",
    "Linked devices",
    "Starred message",
    "Payment",
    "Settings"
  ];
  List chats = [
    {
      "name": "Ram",
      "Message": "I have reached Lanka",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Lakshman",
      "Message": "Bhrata, mujhe aadesh dein, sabko mai akele maar dunga!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Bharat",
      "Message": "Kila fateh karke aaiye! Rajya aapka intezar kar raha hai!",
      "time": "11:15",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Shatrughna",
      "Message": "ALl the best bhrata shree!",
      "time": "11:12",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Hanuman",
      "Message": "Jai Shree Ram. On your command, my lord!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Sita",
      "Message": "I am waiting, Come soon!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": true,
      "sent": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
	      shape:RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30)) )  ,

              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("WhatsApp",style:Theme.of(context).textTheme.headline1),
                  Row(
                    children: [
                      Icon(Icons.search),
                      PopupMenuButton<String>(
                          onSelected: (value) => {print(value)},
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                                PopupMenuItem(
                                  value: "New Group",
                                  child: Text("New Group"),
                                ),
                                PopupMenuItem(
                                  value: "New Broadcast",
                                  child: Text("New Broadcast"),
                                ),
                                PopupMenuItem(
                                  value: "Linked devices",
                                  child: Text("Linked devices"),
                                ),
                                PopupMenuItem(
                                  value: "Starred message",
                                  child: Text("Starred message"),
                                ),
                                PopupMenuItem(
                                  value: "Payment",
                                  child: Text("Payment"),
                                ),
                                PopupMenuItem(
                                  value: "Settings",
                                  child: Text("Settings"),
                                ),
                              ])
                    ],
                  ),
                ],
              ),
            )),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(chats[index]["name"],style:Theme.of(context).textTheme.headline2),
                subtitle: chats[index]["sent"]
                    ?Row(
                        children: [
                          const Icon(Icons.done_all),
                          Text(
                            chats[index]["Message"],
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      )
                    : Text(
                        chats[index]["Message"],
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: index % 2 == 0
                      ? Image.asset("assets/srk.png")
                      : Image.asset("assets/srk1.png"),
                ),
                trailing: Text(chats[index]["time"]),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ChatPage(
                    name: chats[index]["name"],
                    image:
                        index % 2 == 0 ? "assets/srk.png" : "assets/srk1.png",
                  );
                })),
              );
            }));
  }
}
