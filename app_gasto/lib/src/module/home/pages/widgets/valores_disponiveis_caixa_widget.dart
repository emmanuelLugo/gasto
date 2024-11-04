import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
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
        children: [
          SizedBox(
            height: 111,
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
          const SizedBox(height: 10),
          Observer(
            builder: (_) {
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
        ],
      ),
    );
  }

  Widget _buildCaixaCard({
    required ConfiguracaoSistemaController controller,
    required var caixa,
    required TextStyle caixaTextStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 5,
        color: const Color.fromARGB(255, 50, 145, 189),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              caixa.observacao ?? '',
              style: caixaTextStyle,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                  builder: (_) {
                    return Text(
                      controller.mostrarValorDeCaixa
                          ? '   ${formatCurrency(caixa.vlDisponivel(), 1)}'
                          : r'  ******** G$',
                      style: caixaTextStyle,
                    );
                  },
                ),
                IconButton(
                  onPressed: controller.toggleMostrarValorDeCaixa,
                  icon: Icon(
                    controller.mostrarValorDeCaixa
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
