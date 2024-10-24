import 'package:app_gasto/src/core/global/image_constants.dart';
import 'package:flutter/material.dart';

class Bandeiras {
  static Widget banderaById(int idMoeda, {double size = 30.0}) {
    switch (idMoeda) {
      case 1:
        return BandeiraParaguay(key: UniqueKey(), size: size);
      case 2:
        return BandeiraEEUU(key: UniqueKey(), size: size);
      case 3:
        return BandeiraBrasil(key: UniqueKey(), size: size);
      default:
        return Container();
    }
  }

  static Widget banderaVendaById(int idMoeda,
      {double height = 40, double width = 50}) {
    switch (idMoeda) {
      case 1:
        return Image.asset(
          ImageConstants.BANDEIRA_PY,
          height: height,
          width: width,
        );

      case 2:
        return Image.asset(
          ImageConstants.BANDEIRA_USA,
          height: height,
          width: width,
        );
      case 3:
        return Image.asset(
          ImageConstants.BANDEIRA_BRASIL,
          height: height,
          width: width,
        );
      default:
        return Container();
    }
  }
}

class BandeiraParaguay extends StatelessWidget {
  final double size;
  const BandeiraParaguay({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return _CircleBandera(
      asset: ImageConstants.BANDEIRA_PY,
      size: size,
    );
  }
}

class BandeiraBrasil extends StatelessWidget {
  final double size;
  const BandeiraBrasil({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return _CircleBandera(
      asset: ImageConstants.BANDEIRA_BRASIL,
      size: size,
    );
  }
}

class BandeiraEEUU extends StatelessWidget {
  final double size;
  const BandeiraEEUU({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return _CircleBandera(
      asset: ImageConstants.BANDEIRA_USA,
      size: size,
    );
  }
}

class _CircleBandera extends StatelessWidget {
  final String asset;
  final double size;
  const _CircleBandera({
    required this.asset,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      child: ClipOval(
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
          width: size * 2,
          height: size * 2,
        ),
      ),
    );
  }
}
