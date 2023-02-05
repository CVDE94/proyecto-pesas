import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
  const CardForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.width * 0.9,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      //child: const LoginView(),
    );
  }
}
