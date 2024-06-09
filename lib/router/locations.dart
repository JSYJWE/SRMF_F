import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:srmf/screens/main_screen.dart';

//비머 홈로케이션 클래스 생성(인스턴스)
class HomeLocation extends BeamLocation {

  @override
  List get pathBlueprints => ['/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    // TODO: implement buildPages
    return [BeamPage(child: MainScreen(), key: ValueKey('home'))];
  } // 기본값 '/' 슬러시 입력
}