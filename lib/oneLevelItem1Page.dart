import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:rms/SamplePage.dart';
import 'package:flutter/cupertino.dart';

class oneLevelItem1Page extends StatelessWidget {
  const oneLevelItem1Page({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(title: const Text(''));
    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    return MyScaffold(
      route: '/oneLevelItem1',
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.topCenter,
                width: size.width,
                height: screenHeight,
                color: Colors.white,
                padding: EdgeInsets.only(top: 25),
                child: HtmlWidget(
                  '<iframe title="Rizzi Control Tower - Apresentação"'
                  ' width="1140" height="541.25" src="https://app.powerbi.com/reportEmbed?'
                  'reportId=9d00a0f0-94a4-4a58-9ba6-3b3dbc324948&autoAuth=true&ctid=bae03bf'
                  '5-f801-4f8b-adba-c177d66c8180" frameborder="0" allowFullScreen=></iframe>',
                  factoryBuilder: () => MyWidgetFactory(),
                )),
          ],
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
