// ignore_for_file: library_prefixes
import 'package:flutter/material.dart';
import 'package:peseneitor_3000/services/socket_services.dart';
import 'package:peseneitor_3000/src/theme/theme.dart';
import 'package:peseneitor_3000/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';

class CestoDeRopa extends StatefulWidget {
  const CestoDeRopa({Key? key}) : super(key: key);

  @override
  State<CestoDeRopa> createState() => _CestoDeRopaState();
}

class _CestoDeRopaState extends State<CestoDeRopa> {
  String peso = '';
  double valorDouble = 0;
  double porcentaje = 0;

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('mensaje', _handleActiveBands);
    super.initState();
  }

  _handleActiveBands(dynamic payload) {
    peso = payload['peso'];
    try {
      valorDouble = double.parse(peso);
      porcentaje = valorDouble * 50;
    } catch (e) {
      print("El valor $peso no es un número válido.");
    }
    setState(() {});
  }

  @override
  void dispose() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.off('mensaje');
    super.dispose();
  }

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

class CustomRadialProgress extends StatefulWidget {
  final Color color;
  final double porcentaje;
  const CustomRadialProgress({
    super.key,
    required this.color,
    required this.porcentaje,
  });

  @override
  State<CustomRadialProgress> createState() => _CustomRadialProgressState();
}

class _CustomRadialProgressState extends State<CustomRadialProgress> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.8,
      child: RadialProgress(
        porcentaje: widget.porcentaje,
        colorPrimario: widget.color,
        colorSecundario: appTheme.secondaryHeaderColor,
        grosorPrimario: 20,
        grosorSecundario: 5,
        imagen: 'assets/iconos/cesto.png',
      ),
    );
  }
}
