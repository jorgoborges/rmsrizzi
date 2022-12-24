import 'package:flutter/material.dart';
import 'package:rms/SamplePage.dart';
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/homePage',
      body: SafeArea(
        child: SingleChildScrollView(
          child: HtmlWidget(
            '<iframe src="https://rizziconsulting.com.br/"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          ),
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
