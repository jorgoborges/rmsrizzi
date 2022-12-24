import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:rms/SamplePage.dart';

class oneLevelItem1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      route: '/oneLevelItem1',
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: HtmlWidget(
            '<iframe title="Rizzi Control Tower - Apresentação" width="1140" height="541.25" src="https://app.powerbi.com/reportEmbed?reportId=9d00a0f0-94a4-4a58-9ba6-3b3dbc324948&autoAuth=true&ctid=bae03bf5-f801-4f8b-adba-c177d66c8180" frameborder="0" allowFullScreen="true"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          ),
        ),
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
