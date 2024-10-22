import 'package:app_venda/src/module/gasto/models/tipo_gasto.dart';
import 'package:app_venda/src/module/gasto/pages/delegate/tipo_gasto_delegate_controller.dart';
import 'package:flutter/material.dart';

class TipoGastoDelegate extends SearchDelegate<TipoGasto?> {
  final TipoGastoDelegateController _controller;

  TipoGastoDelegate(
    this._controller,
  );

  @override
  String get searchFieldLabel => 'Consulte por la Descripción';

  List<TipoGasto> list = [];
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
      body: FutureBuilder<List<TipoGasto>>(
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
                final TipoGasto classificacao = list[index];
                return Card(
                  child: ListTile(
                    title: Text(
                        '${classificacao.id} - ${classificacao.descricao}'),
                    onTap: () {
                      close(context, classificacao);
                    },
                  ),
                );
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Future<List<TipoGasto>> _search() async {
    list = await _controller.findByCondition(query);

    return list;
  }
}
