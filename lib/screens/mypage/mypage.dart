import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mypage extends StatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => MypageState();
}

class MypageState extends State<Mypage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('마이페이지'),
      ),
      body: Center(

      ),
    );

    throw UnimplementedError();
  }

}