import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'dart:html' as html;
import 'package:rms/HomePage.dart';
import 'package:rms/LoginHome.dart';
import 'package:rms/oneLevelItem1Page.dart';

void main() {
  runApp(SamplePage());
}

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  static MaterialColor themeBlack = MaterialColor(
    _themeBlackPrimaryValue,
    <int, Color>{
      50: Color(_themeBlackPrimaryValue),
      100: Color(_themeBlackPrimaryValue),
      200: Color(_themeBlackPrimaryValue),
      300: Color(_themeBlackPrimaryValue),
      400: Color(_themeBlackPrimaryValue),
      500: Color(_themeBlackPrimaryValue),
      600: Color(_themeBlackPrimaryValue),
      700: Color(_themeBlackPrimaryValue),
      800: Color(_themeBlackPrimaryValue),
      900: Color(_themeBlackPrimaryValue),
    },
  );
  static const int _themeBlackPrimaryValue = 0xFF222222;
  static const Color themeTextPrimary = Color(0xFF9D9D9D);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeBlack,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: themeBlack,
            ),
        primaryTextTheme: Theme.of(context).textTheme.apply(
              bodyColor: themeTextPrimary,
            ),
        primaryIconTheme: const IconThemeData(
          color: themeTextPrimary,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        final page = _getPageWidget(settings);
        if (page != null) {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) => page,
              transitionsBuilder: (_, anim, __, child) {
                return FadeTransition(
                  opacity: anim,
                  child: child,
                );
              });
        }
        return null;
      },
    );
  }

  Widget? _getPageWidget(RouteSettings settings) {
    if (settings.name == null) {
      return null;
    }
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case '/':
        return HomePage();

      case '/oneLevelItem1':
        return oneLevelItem1Page();
    }
    return null;
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key? key,
    required this.route,
    required this.body,
  }) : super(key: key);

  final Widget body;
  final String route;

  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: '*Rizzi Control Tower – Contratos & Reparos',
      children: [
        AdminMenuItem(
          title: '- Contrato de Manutenção',
          route: '/oneLevelItem1',
          children: [],
        ),
        AdminMenuItem(
          title: '- KPI´s – Gestor de Frotas',
          route: '/oneLevelItem2',
          children: [],
        ),
      ],
    ),
    AdminMenuItem(
      title: '*Gestão de Ativos',
      children: [],
    ),
    AdminMenuItem(
      title: '*Gestão Estratégica ',
      children: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.bottomRight,
          child: AutoSizeText(
            'RMS-RIZZI MANAGEMENT SYSTEM',
            style: TextStyle(fontSize: 12),
            maxFontSize: 12,
            maxLines: 1,
          ),
        ),
        actions: [
          IconButton(
              tooltip: 'Sair',
              iconSize: 20,
              icon: const Icon(Icons.exit_to_app_outlined),
              color: Colors.white,
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginHome()))),
        ],
        backgroundColor: const Color(0xff041e42),
      ),
      sideBar: SideBar(
        backgroundColor: const Color(0xFFEEEEEE),
        activeBackgroundColor: Colors.black26,
        borderColor: const Color(0xFFE7E7E7),
        iconColor: Colors.black87,
        activeIconColor: Colors.blue,
        textStyle: const TextStyle(
          color: Color(0xFF337ab7),
          fontSize: 12,
        ),
        activeTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != route) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        // header: Container(
        // height: 50,
        //width: double.infinity,
        //   color: const Color(0xffffffff),
        //   child: const Center(
        //      child: Image(
        //      image: AssetImage("assets/images/image1.png"),
        //        fit: BoxFit.fill,
        //       height: 100,
        //     width: 100,
        //    )
        //  ),
        //   ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xffffffff),
          child: const Center(
            child: AutoSizeText(
              'Rizzi Consulting Ⓡ 2000|2023 Todos os Direitos Reservados',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 7),
              maxLines: 3,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
