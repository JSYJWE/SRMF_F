import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srmf/widgets/bottom_bar.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => PaymentState();
}

class PaymentState extends State<Payment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('결제 하기'),
      ),
      body: Center(

      ),
    );

    throw UnimplementedError();
  }

}