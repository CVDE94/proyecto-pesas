import 'package:flutter/material.dart';
import 'package:peseneitor_3000/services/services.dart';
import 'package:peseneitor_3000/src/views/views.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final authService = Provider.of<AuthService>(context, listen: false);

    final pages = [
      const CestoDeRopa(),
      const LiquidoDeRopa(),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.pest_control_rodent_outlined),
              activeIcon: const Icon(Icons.pest_control_rodent),
              label: 'Cesto',
              backgroundColor: colors.primary,
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.personal_injury_outlined),
                activeIcon: const Icon(Icons.personal_injury_rounded),
                label: 'Liquido',
                backgroundColor: colors.secondary),
          ],
        ),
      ),
    );
  }
}
