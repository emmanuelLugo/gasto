import 'package:app_gasto/src/module/gasto/models/classificacao_gasto.dart';
import 'package:app_gasto/src/module/gasto/pages/delegate/classificacao_gasto_delegate_controller.dart';
import 'package:flutter/material.dart';

class ClassificacaoGastoDelegate extends SearchDelegate<ClassificacaoGasto?> {
  final ClassificacaoGastoDelegateController _controller;

  ClassificacaoGastoDelegate(
    this._controller,
  );

  @override
  String get searchFieldLabel => 'Consulte por la Descripción';

  List<ClassificacaoGasto> list = [];
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
      body: FutureBuilder<List<ClassificacaoGasto>>(
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
                final ClassificacaoGasto classificacao = list[index];
                return Card(
                  child: ListTile(
                    title: Text(
                        '${classificacao.id} - ${classificacao.descricao}'),
                    subtitle: Text(classificacao.tipoGasto?.descricao ?? ''),
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
    return buildResults(context);
  }

  Future<List<ClassificacaoGasto>> _search() async {
    list = await _controller.findByCondition(query);

    return list;
  }
}
