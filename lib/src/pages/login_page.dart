import 'package:flutter/material.dart';
import 'package:peseneitor_3000/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: size.height * 0.3,
              child: Image.asset(
                'assets/Logo-Principal.png',
                fit: BoxFit.contain,
              ),
            ),
            const CardForm(),
          ],
        ),
      )),
    );
  }
}
