import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srmf/widgets/bottom_bar.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  State<ChatList> createState() => ChatListState();
}

class ChatListState extends State<ChatList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('채팅 목록'),
      ),
      body: Center(
      ),
    );

    throw UnimplementedError();
  }

}