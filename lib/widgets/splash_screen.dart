import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ExtendedImage.asset('../../assets/images/icon_main_rice.png'),
              CircularProgressIndicator(color: Colors.red,)
            ],
          ),
        ),
      ),
    );
  }
}
