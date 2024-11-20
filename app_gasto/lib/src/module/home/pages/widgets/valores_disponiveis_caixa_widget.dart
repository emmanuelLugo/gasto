import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/home/pages/configuracao_sistema_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ValoresDisponiveisCaixaWidget extends StatelessWidget {
  final ConfiguracaoSistemaController controller;
  final PageController pageController;

  const ValoresDisponiveisCaixaWidget({
    super.key,
    required this.controller,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    const TextStyle caixaTextStyle = TextStyle(
      fontSize: 22,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(height: 20),
          Flexible(
            child: Observer(
              builder: (_) {
                return PageView.builder(
                  itemCount: controller.caixasAbertas.length,
                  controller: pageController,
                  itemBuilder: (context, index) => _buildCaixaCard(
                    controller: controller,
                    caixa: controller.caixasAbertas[index],
                    caixaTextStyle: caixaTextStyle,
                  ),
                );
              },
            ),
          ),
          Observer(
            builder: (_) {
              if (controller.caixasAbertas.isEmpty) {
                return const SizedBox.shrink();
              }
              return SmoothPageIndicator(
                controller: pageController,
                count: controller.caixasAbertas.length,
                effect: const WormEffect(
                  activeDotColor: Color.fromARGB(255, 50, 145, 189),
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.normal,
                ),
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCaixaCard({
    required ConfiguracaoSistemaController controller,
    required Caixa caixa,
    required TextStyle caixaTextStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              caixa.observacao ?? '',
              style: caixaTextStyle,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                      controller.mostrarValorDeCaixa
                          ? '   Gs. ${formatNumberByMoeda(number: caixa.vlDisponivel(), idMoeda: 1)}'
                          : '   Gs. *********',
                      style: caixaTextStyle,
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return IconButton(
                      onPressed: controller.toggleMostrarValorDeCaixa,
                      icon: Icon(
                        controller.mostrarValorDeCaixa
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
