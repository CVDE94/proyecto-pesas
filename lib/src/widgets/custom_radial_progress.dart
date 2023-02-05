import 'package:flutter/material.dart';
import 'package:peseneitor_3000/src/theme/theme.dart';
import 'package:peseneitor_3000/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  final double porcentaje;
  final double grosorPrimario;
  final double grosorSecundario;
  final String imagen;
  const CustomRadialProgress({
    super.key,
    required this.color,
    required this.porcentaje,
    required this.grosorPrimario,
    required this.grosorSecundario,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.8,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme.secondaryHeaderColor,
        grosorPrimario: grosorPrimario,
        grosorSecundario: grosorSecundario,
        imagen: imagen,
      ),
    );
  }
}
