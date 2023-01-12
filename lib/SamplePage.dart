import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:rms/HomePage.dart';
import 'loginHome.dart';
import 'oneLevelItem1Page.dart';
import 'oneLevelItem2Page.dart';

void main() {
  runApp(const SamplePage());
}

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  _SamplePageState createState() {
    return _SamplePageState();
  }
}

class _SamplePageState extends State<SamplePage> {
  static MaterialColor themeBlack = const MaterialColor(
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
  static const int _themeBlackPrimaryValue = 0xff041e42;
  static const Color themeTextPrimary = Color(0xff041e42);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMS',
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
      case '/secondLevelItem1':
        return oneLevelItem1Page();
      case '/oneLevelItem2Page':
        return oneLevelItem2Page();
      case '/oneLevelItem2Page':
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
      title: 'Rizzi Consulting',
      route: '/',
      //icon: Icons.home,
    ),
    AdminMenuItem(
      title: 'Rizzi Control Tower – Contratos & Reparos',
      // icon: Icons.cell_tower,
      children: [
        AdminMenuItem(
          title: 'Contrato de Manutenção',
          route: '/secondLevelItem1',
        ),
        AdminMenuItem(
          title: 'KPI´s – Gestor de Frotas',
          route: '/oneLevelItem2Page',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
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
        activeIconColor: Colors.black87,
        textStyle: const TextStyle(
          color: Color(0xFF337ab7),
          wordSpacing: 1,
          fontSize: 12,

        ),
        activeTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          if (item.route != null && item.route != route) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: Container(
          height: 50,
          //width: double.infinity,
          color: const Color(0xff2e7d32),
          child: const Center(
            child: Text(
              'header',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          // width: double.infinity,
          color: const Color(0xff2e7d32),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
