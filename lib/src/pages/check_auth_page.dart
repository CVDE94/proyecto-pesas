// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:peseneitor_3000/services/services.dart';
import 'package:peseneitor_3000/src/pages/pages.dart';
import 'package:provider/provider.dart';

class CheckAuthPage extends StatelessWidget {
  const CheckAuthPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authService.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            Future.microtask(
              () async {
                final resp = await authService.readToken();
                if (resp != '') {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const MainPage(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const LoginPage(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                }
              },
            );
            return Container();
          },
        ),
      ),
    );
  }
}
