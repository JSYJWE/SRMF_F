import 'package:flutter/material.dart';
import 'package:srmf/screens/main_screen.dart';

//비머가드 false 일때 리턴화면 로그인하지않은 유저
class AuthScreen extends StatelessWidget {
  //페이지 컨트롤러
  PageController _pageController = PageController();

  AuthScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
        MainScreen(),
        Container(color: Colors.accents[2],),
        Container(color: Colors.accents[3],),
      ],
      ),
    );
  }
}
