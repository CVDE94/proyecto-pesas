import 'package:flutter/material.dart';
import 'package:peseneitor_3000/src/theme/theme.dart';
import 'package:peseneitor_3000/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class CestoDeRopa extends StatefulWidget {
  const CestoDeRopa({Key? key}) : super(key: key);

  @override
  State<CestoDeRopa> createState() => _CestoDeRopaState();
}

class _CestoDeRopaState extends State<CestoDeRopa> {
  double porcentaje = 15.7;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomRadialProgress(color: colors.primary, porcentaje: porcentaje),
      ],
    ));
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  final double porcentaje;
  const CustomRadialProgress({
    super.key,
    required this.color,
    required this.porcentaje,
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
        grosorPrimario: 20,
        grosorSecundario: 5,
        imagen: 'assets/iconos/cesto.png',
      ),
    );
  }
}
