import 'package:flutter/material.dart';
import 'package:rms/SamplePagePortal.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/homeoardPage',
      body: Container(
        height: 600,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(left: 20,right: 20, top: 155, ),

        child: Image(
            image: AssetImage("assets/images/image3.png.png"),
            fit: BoxFit.contain),
      ),
    );
  }
}