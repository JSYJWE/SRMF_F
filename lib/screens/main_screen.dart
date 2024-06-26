import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srmf/screens/chat/chat_list.dart';
import 'package:srmf/screens/mypage/mypage.dart';
import 'package:srmf/screens/payment/payment.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => MainState();
// }
//
// class MainState extends State<MainScreen>{
//   int _selectedIndex = 1;
//   final List<Widget> _widgetOptions = <Widget>[ChatList(),MainScreen(),Payment(),Mypage()];
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index; // 페이지/네비게이션 바 활성화 값 적용
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex),),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(Icons.chat_rounded),
//               label: '채팅,'
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: '홈',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.payment),
//               label: '결제',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_box_rounded),
//               label: '마이페이지',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.red,
//         onTap: _onItemTapped,
//       ),
//       // bottomNavigationBar: Obx(
//       //     () => NavigationBar(
//       //       height: 80,
//       //       elevation: 0,
//       //       selectedIndex: controller.selectedIndex.value,
//       //       onDestinationSelected: (index) => controller.selectedIndex.value = index,
//       //       destinations: const [
//       //         NavigationDestination(icon: Icon(Icons.chat_rounded), label: "채팅"),
//       //         NavigationDestination(icon: Icon(Icons.home_filled), label: "홈"),
//       //         NavigationDestination(icon: Icon(Icons.payment), label: "결제"),
//       //         NavigationDestination(icon: Icon(Icons.account_box_rounded), label: "마이페이지"),
//       //       ],
//       //     ),
//       // ),
//       // body: Obx(()=> controller.screens[controller.selectedIndex.value]),
//     );
//
//     throw UnimplementedError();
//   }
//
//   @override
//   void initState() {
//     //클래스 라이프사이클 시작부 초기 호출
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     //클래스 라이프사이클 종료부 호출
//     super.dispose();
//   }
// }

class MainScreen extends StatefulWidget {
  //페이지컨트롤러 적용
  // PageController controller;

  const MainScreen({Key ? key}) : super(key : key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext contet) {
    return Scaffold(
      appBar: AppBar(
        title: Text('제목'),
        actions: [],
      ),
      body: IndexedStack(
        index: _bottomSelectedIndex,
        children: [
          ChatList(),
          Container(
            color: Colors.accents[4],
          ),
          Payment(),
          Mypage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomSelectedIndex,

        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(_bottomSelectedIndex == 0 ? Icons.chat_bubble : Icons.chat_bubble_outline_sharp), label: '채팅',),
          BottomNavigationBarItem(icon: Icon(_bottomSelectedIndex == 1 ? Icons.home : Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(_bottomSelectedIndex == 2 ? Icons.payments_outlined : Icons.payment_outlined), label: '결제'),
          BottomNavigationBarItem(icon: Icon(_bottomSelectedIndex == 3 ? Icons.account_box : Icons.account_box_outlined), label: '마이페이지'),
        ],
        onTap: (index){
          setState(() {
            _bottomSelectedIndex  = index;
          });
        },
      ),
    );
  }
}

// class _NavigationState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text('홈'),
//       ),
//       body: Center(
//       ),
//     );
//
//     throw UnimplementedError();
//   }
  // int selectedIndex = 0;
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: selectedIndex,
  //       onTap: (value) => setState(() {
  //         selectedIndex = value;
  //       }),
  //       items: const [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: "Home",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.search_rounded),
  //           label: "Search",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.settings),
  //           label: "Settings",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.settings),
  //           label: "Settings",
  //         ),
  //       ],
  //     ),
  //     appBar: AppBar(
  //       title: const Text("Navigation123"),
  //     ),
  //     body: IndexedStack(
  //       index: selectedIndex,
  //       children: [
  //         ChatList(),
  //         Container(),
  //         Payment(),
  //         Mypage()
  //       ],
  //     ),
  //   );
  // }
//}