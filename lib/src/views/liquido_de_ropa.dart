import 'package:flutter/material.dart';
import 'package:peseneitor_3000/src/widgets/custom_radial_progress.dart';

class LiquidoDeRopa extends StatefulWidget {
  const LiquidoDeRopa({Key? key}) : super(key: key);

  @override
  State<LiquidoDeRopa> createState() => _LiquidoDeRopaState();
}

class _LiquidoDeRopaState extends State<LiquidoDeRopa> {
  double porcentaje = 70.0;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomRadialProgress(
          color: colors.secondary,
          porcentaje: porcentaje,
          grosorPrimario: 20.0,
          grosorSecundario: 5.0,
          imagen: 'assets/iconos/botella.png',
        ),
      ],
    ));
  }
}
