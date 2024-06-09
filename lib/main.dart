import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srmf/router/locations.dart';
import 'package:srmf/screens/auth/auth_screen.dart';
import 'package:srmf/screens/chat/chat_list.dart';
import 'package:srmf/screens/main_screen.dart';
import 'package:srmf/screens/mypage/mypage.dart';
import 'package:srmf/screens/payment/payment.dart';
import 'package:srmf/widgets/splash_screen.dart';

//비머 전역 선언
final _routerDelegate = BeamerDelegate(
    guards: [BeamGuard(
        pathBlueprints: ['/'],//root로 해놔서 그런것 mypage일때 로그인!
        check: (context, location) {return false;},
        showPage: BeamPage(child: AuthScreen())//로그인하라고 이동시킬페이지
    )],
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [HomeLocation()]
    )
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //퓨처함수로 로딩 구현
    return FutureBuilder<Object>(
        future: Future.delayed(Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: Duration(microseconds: 900), //페이드인아웃 효과
              child: _splashLodingWidget(snapshot), //스냅샷 실행 위젯지정
          );
        }
    );
  }

  /**
   * 스플래쉬 로딩 위젯 선언(인스턴스)
   */
  StatelessWidget _splashLodingWidget(AsyncSnapshot<Object> snapshot) {
    if(snapshot.hasError) {print('에러가 발생하였습니다.'); return Text('Error');}
    else if(snapshot.hasData) {return SrmfApp();}
    else {return SplashScreen();}
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationState();
}

class _NavigationState extends State<NavigationBar> {

  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.white70,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) =>
            setState(() {
              selectedIndex = value;
            }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: "채팅",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: "결제",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "마이페이지",
          ),
        ],
        iconSize: 30, // 아이콘 크기 조정
        selectedFontSize: 14, // 선택된 라벨의 글꼴 크기 조정
        unselectedFontSize: 12, // 선택되지 않은 라벨의 글꼴 크기 조정
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          ChatList(),
          MainScreen(),
          Payment(),
          Mypage()
        ],
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

//홈페이지 클래스 선언
class SrmfApp extends StatelessWidget {
  const SrmfApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}