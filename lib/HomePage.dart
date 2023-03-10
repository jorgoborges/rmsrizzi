import 'package:flutter/material.dart';
import 'package:rms/SamplePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(title: const Text(''));
    var size = MediaQuery.of(context).size;
    var screenHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    return MyScaffold(
      route: '/homePage',
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
                '<iframe src="https://rizziconsulting.com.br/"></iframe>',
                factoryBuilder: () => MyWidgetFactory(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
