import 'package:flutter/material.dart';
import 'package:messaging_app/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
late User singedInUser;

class ChatScreen extends StatefulWidget {
  static const screenRoute = 'chat_screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        singedInUser = user;
        print(singedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }


  // void messagesStrems() async {
  //   await for (var snapshot in _firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(children: [
          Image.asset(
            '$myImagesPath/logo.png',
            height: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Message Me')
        ]),
        actions: [
          IconButton(
              onPressed: () {
                // messagesStrems();
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.close))
        ],
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              messageStreamBuilder(),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.orange, width: 2))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        
                        controller: messageTextController,
                        onChanged: (value) => {messageText = value},
                        decoration: InputDecoration(
                        
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: 'Write Your Meassage Here...',
                          border: InputBorder.none,
                        ),
                        
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': singedInUser.email,
                          'time': FieldValue.serverTimestamp(),
                        });
                      },
                      child: Text(
                        'send',
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}

class messageStreamBuilder extends StatelessWidget {
  const messageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          List<messageWidgetUI> messageWidgets = [];
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.yellow[900]),
            );
          }
          final messages = snapshot.data != null ? snapshot.data!.docs.reversed  as Iterable : [];
          for (var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final currentUser = singedInUser.email;

            

            final messageWidget = messageWidgetUI(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
            );
            messageWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidgets,
            ),
          );
        });
  }
}

class messageWidgetUI extends StatelessWidget {
  const messageWidgetUI({super.key, required this.sender, required this.text, required this.isMe});
  final String? sender;
  final String? text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '$sender',
              style: TextStyle(fontSize: 12, color: Colors.yellow[900]),
            ),
          ),
          Material(
              borderRadius: isMe ? BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),

              )
              :
              BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),

              ),
              elevation: 5,
              color: isMe ? Colors.blue[800] : Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '$text',
                  style: TextStyle(fontSize: 15, color: isMe ? Colors.white : Colors.black45),
                ),
              )),
        ],
      ),
    );
  }
}
