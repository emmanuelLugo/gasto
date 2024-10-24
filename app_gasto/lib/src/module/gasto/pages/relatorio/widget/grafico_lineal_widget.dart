import 'package:app_gasto/src/core/components/fields/number_form_input/number_format.dart';
import 'package:app_gasto/src/module/gasto/models/dto/total_classificacao_gasto_dto.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class GraficoLinealWidget extends StatefulWidget {
  final ObservableList<TotalClassificacaoGastoDto> listDto;
  const GraficoLinealWidget({super.key, required this.listDto});

  @override
  State<GraficoLinealWidget> createState() => _GraficoLinealWidgetState();
}

class _GraficoLinealWidgetState extends State<GraficoLinealWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listDto.length,
      itemBuilder: (context, index) {
        final gasto = widget.listDto[index];
        return _buildGastoItem(gasto, index);
      },
    );
  }

  Widget _buildGastoItem(TotalClassificacaoGastoDto dto, int index) {
    return ListTile(
      onTap: () {
        //mostrar detalles en un modal
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Detalles'),
                const SizedBox(height: 16),
                Text(
                  'Descripción: ${dto.descricao}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  formatCurrency(dto.vlTotal ?? 0.0, 1),
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Porcentaje: ${dto.vlPorcentagem}%',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            );
          },
        );
      },
      leading: Icon(Icons.circle,
          color: coresPredefinidos[index % coresPredefinidos.length]),
      title: Text('${dto.descricao} ${dto.vlPorcentagem}%'),
      subtitle: Text(' ${formatCurrency(dto.vlTotal ?? 0.0, 1)}'),
      trailing: SizedBox(
        width: 100,
        child: LinearProgressIndicator(
          value: (dto.vlPorcentagem ?? 1) / 100,
          backgroundColor: Colors.grey,
          color: coresPredefinidos[index % coresPredefinidos.length],
        ),
      ),
    );
  }
}
