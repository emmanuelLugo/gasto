import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/core/pagination/footer_pagination_bar.dart';
import 'package:app_gasto/src/module/gasto/pages/gasto/widgets/card_gasto_widget.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/relatorio_gasto_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RelatorioGastoPage extends StatelessWidget {
  final RelatorioGastoController controller;
  const RelatorioGastoPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte'),
      ),
      persistentFooterButtons: [
        Observer(
          builder: (_) => FooterPaginationBar(
            paginaAtual: controller.pagination.pageNr,
            setPagAtual: (i) => controller.setPaginaAtual(i),
            pageSize: controller.pagination.pageSize,
            isLastPage: controller.pagination.isLastPage,
            totalRegistros: controller.pagination.totalRegistros,
            pages: controller.pagination.pages,
          ),
        ),
      ],
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Observer(
            builder: (_) {
              return Text(
                'total de gasto: ${formatCurrency(controller.vlTotal, 1)}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            },
          ),
          const Divider(),
          Expanded(
            child: Observer(
              builder: (_) {
                if (controller.status == RelatorioGastoStatusState.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.gastos.length,
                  itemBuilder: (context, index) {
                    final gasto = controller.gastos[index];
                    return CardGastoWidget(gasto: gasto);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
