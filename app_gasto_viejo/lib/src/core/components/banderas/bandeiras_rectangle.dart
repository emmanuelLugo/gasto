import 'package:flutter/material.dart';

class BandeirasRectangle {
  static Widget banderaById(int idMoeda, {double width = 30.0}) {
    switch (idMoeda) {
      case 1:
        return _BandeiraParaguay(key: UniqueKey(), width: width);
      case 2:
        return _BandeiraBrasil(key: UniqueKey(), width: width);
      case 3:
        return _BandeiraEEUU(key: UniqueKey(), width: width);
      case 4:
        return _BandeiraArgentina(key: UniqueKey(), width: width);
      default:
        return Container();
    }
  }
}

class _BandeiraParaguay extends StatelessWidget {
  final double width;
  const _BandeiraParaguay({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return _RectangleBandera(
      asset: 'assets/banderas/py.png',
      width: width,
    );
  }
}

class _BandeiraBrasil extends StatelessWidget {
  final double width;
  const _BandeiraBrasil({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return _RectangleBandera(
      asset: 'assets/banderas/br.png',
      width: width,
    );
  }
}

class _BandeiraEEUU extends StatelessWidget {
  final double width;
  const _BandeiraEEUU({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return _RectangleBandera(
      asset: 'assets/banderas/us.png',
      width: width,
    );
  }
}

class _BandeiraArgentina extends StatelessWidget {
  final double width;
  const _BandeiraArgentina({super.key, this.width = 1});

  @override
  Widget build(BuildContext context) {
    return _RectangleBandera(
      asset: 'assets/banderas/ar.png',
      width: width,
    );
  }
}

class _RectangleBandera extends StatelessWidget {
  final String asset;
  final double width;
  const _RectangleBandera({
    required this.asset,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
        width: width,
      ),
    );
  }
}
