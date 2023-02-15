import 'package:flutter/material.dart';
import 'package:peseneitor_3000/services/services.dart';
import 'package:peseneitor_3000/services/socket_services.dart';
import 'package:peseneitor_3000/src/pages/pages.dart';

import 'package:peseneitor_3000/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SocketService()),
          ChangeNotifierProvider(create: (context) => AuthService()),
          ChangeNotifierProvider(create: (context) => ThemeChanger(1)),
        ],
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Material App',
      theme: currentTheme,
      //ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: 'checking',
      routes: {
        'login': (context) => const LoginPage(),
        'home': (context) => const MainPage(),
        'register': (context) => const RegisterPage(),
        'checking': (context) => const CheckAuthPage(),
      },
      scaffoldMessengerKey: NotificationsService.messengerkey,
    );
  }
}
