import 'package:app_gasto/src/core/utils/date/date_util.dart';
import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CaixaDelegate extends SearchDelegate<Caixa?> {
  final CaixaDelegateController _controller;

  CaixaDelegate(
    this._controller,
  );

  @override
  String get searchFieldLabel => 'Consulte por la Descripción';

  List<Caixa> list = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Caixa>>(
        future: _search(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (list.isEmpty) {
              return const Center(
                child: Text(
                  "Sin datos para mostrar",
                ),
              );
            }

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final Caixa caixa = list[index];
                return _buildCard(caixa, context);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildCard(Caixa caixa, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${caixa.id} - ${caixa.observacao}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ESTADO: ${caixa.isAberto! ? 'ABIERTO' : 'CERRADO'}'),
            Row(
              children: [
                Expanded(
                  child:
                      Text('APERTURA: ${DateUtil.format(caixa.dtAbertura!)}'),
                ),
                Text(caixa.isAberto!
                    ? ''
                    : 'CIERRE: ${DateUtil.format(caixa.dtFechamento ?? DateTime.now())}'),
              ],
            ),
          ],
        ),
        onTap: () {
          close(context, caixa);
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  Future<List<Caixa>> _search() async {
    list = await _controller.findByCondition(query);

    return list;
  }
}
