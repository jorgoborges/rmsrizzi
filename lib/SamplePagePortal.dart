import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'dart:html' as html;

import 'package:rms/HomePage.dart';
import 'package:rms/LoginHome.dart';
import 'package:rms/oneLevelItem1.dart';

void main() {
  runApp(SamplePagePortal());
}

class SamplePagePortal extends StatefulWidget {
  @override
  _SamplePagePortalState createState() => _SamplePagePortalState();
}

class _SamplePagePortalState extends State<SamplePagePortal> {
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
      title: 'Control Tower',
      icon: Icons.cell_tower,
      children: [
        AdminMenuItem(
          title: 'Gestão de Operação ( Motorista )',
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Excesso de Velocidade + Excesso de Velocidade na Chuva',
              route: '/oneLevelItem1',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title:
                  'Excesso de Marcha Lenta + Excesso de Marcha Lenta com A/C',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Banguela',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: '% Faixa Verde Econômica',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Freada Brusca',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Excesso de RPM',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Gestão de Combustível / ARLA',
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Estratificação por Modelo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Consumo km da Frota',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Top 10 Veículos com Maior Consumo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Aplicação Check-list de Consumo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Treinamento Instrutor Operacional',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Acompanhamento do Consumo por Veículo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Gestão de Manutenção',
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Monitoramento da Saúde dos Ativos',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Planejamento das Manutenções',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Performance dos Motoristas',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Monitoramento da Disponibilidade',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Confiabilidade de Manutenção ( Quebra por Km )',
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Quebra por KM - Geral',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Top 10 Grupos e Subgrupos',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Análise Crítica de Ofensores',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Acompanhamento Falhas em Garantia',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Melhoria na Disponibilidade do Veículo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Serviços ( Desempenho do Produto )',
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Custo de Operação do Veículo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Aplicação de Peças e Serviços',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Estrafificação por modelo e ano ( 5 anos )',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Durabilidade - Peças Aplicadas',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Acompanhamento - Custo de Operação ( Peças )',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Gestão de Componentes',
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Estratificação por Compomente e Modelo ',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Análise 1ª Vida - Genuína e Não Genuína',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Análise 2ª Vida - Genuína e Não Genuína',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Desempenho por Compomente',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Treinamento Sob Demanda',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Melhorias nos Intervalos de Manutenção',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'CPK - Peças',
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Consumo do Veículo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Estratificação por Preço e Modelo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Avaliação de Volume x Aplicação',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Desempenho - CPK',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Pacotes de Peças por Grupo - Top 20',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Pacotes de Peças',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Gestão de Pneus',
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Compra ( Fornecedor / Km mádio / Preço Unitário / CPK )',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Itendtificação de Pneus e Controle',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title:
                  'Montagem ( Como; Característica, Ex. Dianteira não Monta Recapados )',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title:
                  'Controle ( Coleta, Histórico de Dados; Calibragem; Alinhamento / Balanceamento; Rodízios; Profundidade dos Sulcos; Cortes; etc )',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title:
                  'Gestão ( Custo total de Manutenção, Custo Aplicado dos pneus; Gastos com pneus na estrada; Índice de sucateamento )',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title:
                  'Descarte ( Ex. Vendidos na segunda recapagem; podendo ainda ser recapados; pneus que não servem vão para o sucateiro especializado )',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Gestão de Disponibilidade', //09
          route: '/',
          icon: Icons.subscriptions_outlined,
          children: [
            AdminMenuItem(
              title: 'Frota',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Fluxo de Transporte',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Garantia de Disponibilidade',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
      ],
    ),
    AdminMenuItem(
      title: 'Gestão de Ativos',
      icon: Icons.business_center_outlined,
      children: [
        AdminMenuItem(
          title: 'Visão Geral da Frota',
          route: '/',
          icon: Icons.subscriptions_outlined,
        ),
        AdminMenuItem(
          title: 'Gastos x Metas',
          route: '/',
          icon: Icons.subscriptions_outlined,
        ),
        AdminMenuItem(
          title: 'Operação da Frota',
          route: '/',
          icon: Icons.subscriptions_outlined,
        ),
        AdminMenuItem(
          title: 'Desenvolvimento da Frota',
          route: '/',
          icon: Icons.subscriptions_outlined,
        ),
        AdminMenuItem(
          title: 'Resumo de Contas',
          route: '/',
          icon: Icons.subscriptions_outlined,
        ),
        AdminMenuItem(
          title: 'Informação de Contas',
          route: '/',
          icon: Icons.subscriptions_outlined,
        ),
        AdminMenuItem(
          title: 'Tendência da Moeda ( Financeiro )',
          route: '/',
          icon: Icons.subscriptions_outlined,
        ),
        AdminMenuItem(
          title: 'Previsão no Ano Corrente',
          route: '/',
          icon: Icons.subscriptions_outlined,
        ),
      ],
    ),
    AdminMenuItem(
      title: 'Gestão Estratégica',
      icon: Icons.network_check_outlined,
      children: [
        AdminMenuItem(
          title: 'Gestão VN',
          route: '/',
          icon: Icons.bookmark_added_outlined,
          children: [
            AdminMenuItem(
              title: 'Macroeconômica',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Análise Concorrência',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'RoadMap',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Business Plan ',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Vitrine Acessórios e P&S',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Interação Cliente',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Gestão atividades / Temperatura de Campo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Gestão PV',
          route: '/',
          icon: Icons.bookmark_added_outlined,
          children: [
            AdminMenuItem(
              title: 'Macroeconômica',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Análise Concorrência',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'RoadMap',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Business Plan',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Vitrine P&S e Acessórios',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Interação Cliente',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Gestão atividades / Temperatura de Campo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
        AdminMenuItem(
          title: 'Gestão SN',
          route: '/',
          icon: Icons.bookmark_added_outlined,
          children: [
            AdminMenuItem(
              title: 'Macroeconômica',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Análise Concorrência',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'RoadMap',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Business Plan ',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Vitrine P&S e Acessórios',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Interação Cliente',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
            AdminMenuItem(
              title: 'Gestão Atividades / Temperatura de Campo',
              route: '/',
              icon: Icons.subdirectory_arrow_right,
            ),
          ],
        ),
      ],
    ),
  ];

  //final List<AdminMenuItem> _adminMenuItems = const [
  // AdminMenuItem(
  //   title: 'User Profile',
  //    icon: Icons.account_circle,
  //     route: '/',
  //   ),
  //   AdminMenuItem(
  //     title: 'Settings',
  //     icon: Icons.settings,
  //     route: '/',
//    ),
//    AdminMenuItem(
  //    title: 'Logout',
  //     icon: Icons.logout,
  //     route: '/',
//    ),
//  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: const Color(0xFF041e42),
        actions: [
          // PopupMenuButton<AdminMenuItem>(
          //    child: const Icon(Icons.account_circle),
          //    itemBuilder: (context) {
          ////     return _adminMenuItems.map((AdminMenuItem item) {
          //     return PopupMenuItem<AdminMenuItem>(
          //       value: item,
          //       child: Row(
          //         children: [
          //          Icon(item.icon),
          //         Padding(
          //       padding: const EdgeInsets.only(left: 8.0),
          //       child: Text(
          //        item.title,
          //       style: const TextStyle(
          //         fontSize: 14,
          //        ),
          //       ),
          //     ),
          //    ],
          //   ),
          //   );
          //     }).toList();
          //    },
          //     onSelected: (item) {
          //       print(
          //    'actions: onSelected(): title = ${item.title}, route = ${item.route}');
          //       Navigator.of(context).pushNamed(item.route!);
          //     },
          //       ),

          IconButton(
              tooltip: 'Sair',
              iconSize: 25,
              icon: const Icon(Icons.exit_to_app_outlined),
              color: Colors.white,
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginHome()))),
          IconButton(
            tooltip: 'Rizzi Academy',
            iconSize: 25,
            icon: const Icon(Icons.school_outlined),
            color: Colors.white,
            onPressed: () {
              html.window.open(
                  'https://www.rizziacademy.com.br/login/index.php/', "_blank");
            },
          ),
          IconButton(
            tooltip: 'Rizzi Consulting',
            iconSize: 25,
            icon: const Icon(Icons.home_outlined),
            color: Colors.white,
            onPressed: () {
              html.window.open('https://rizziconsulting.com.br/', "_blank");
            },
          ),

          TextButton(
            onPressed: () async {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const <Widget>[
                Image(
                  image: AssetImage("assets/images/image1.png.png"),
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ),
        ],
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
        header: Container(
          height: 40,
          width: double.infinity,
          color: const Color(0xff007a33),
          child: const Center(
            child: Text('RMS - RIZZI MANAGEMENT SYSTEM',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
        footer: Container(
          height: 40,
          width: double.infinity,
          color: const Color(0xff007a33),
          child: const Center(
            child: Text(
              'Rizzi Consulting Ⓡ 2000|2022',
              style: TextStyle(
                color: Colors.white,
              ),
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
