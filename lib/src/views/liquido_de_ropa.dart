import 'package:flutter/material.dart';
import 'package:peseneitor_3000/services/socket_services.dart';
import 'package:peseneitor_3000/src/widgets/custom_radial_progress.dart';
import 'package:provider/provider.dart';

class LiquidoDeRopa extends StatefulWidget {
  const LiquidoDeRopa({Key? key}) : super(key: key);

  @override
  State<LiquidoDeRopa> createState() => _LiquidoDeRopaState();
}

class _LiquidoDeRopaState extends State<LiquidoDeRopa> {
  String pesoliquido = '';
  double valorDoubleliquido = 0;
  double porcentajeliquido = 0;

  @override
  void initState() {
    final socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on('mensaje', _handleActiveBands);
    super.initState();
  }

  _handleActiveBands(dynamic payload) {
    pesoliquido = payload['peso'];
    try {
      valorDoubleliquido = double.parse(pesoliquido);
      porcentajeliquido = valorDoubleliquido * 100;
    } catch (e) {
      print("El valor $pesoliquido no es un número válido.");
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
        CustomRadialProgress(
          color: colors.secondary,
          porcentaje: porcentajeliquido,
          grosorPrimario: 20.0,
          grosorSecundario: 5.0,
          imagen: 'assets/iconos/botella.png',
        ),
      ],
    ));
  }
}
