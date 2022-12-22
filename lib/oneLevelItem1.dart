import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:rms/SamplePagePortal.dart';


class oneLevelItem1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/oneLevelItem1',
      body: Container(
        height: 600,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(left: 20, top: 50),
        child: IconButton(
          tooltip: 'Power Bi',
          iconSize: 300,
          icon: const Icon(Icons.insert_chart_outlined),
          color: Colors.black,
          onPressed: () {

            html.window.open(
                'https://app.powerbi.com/reportEmbed?reportId=fe6de127-f910-4618-a02b-fbd48ed4d3b1&autoAuth=true&ctid=bae03bf5-f801-4f8b-adba-c177d66c8180&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLWJyYXppbC1zb3V0aC1iLXByaW1hcnktcmVkaXJlY3QuYW5hbHlzaXMud2luZG93cy5uZXQvIn0%3D',
                "_blank",
                'location=yes');
          },
        ),
      ),
    );
  }
}
