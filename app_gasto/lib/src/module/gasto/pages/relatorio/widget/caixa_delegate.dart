import 'package:app_gasto/src/module/gasto/models/caixa.dart';
import 'package:app_gasto/src/module/gasto/pages/caixa/widgets/card_caixa_widget.dart';
import 'package:app_gasto/src/module/gasto/pages/relatorio/widget/caixa_delegate_controller.dart';
import 'package:flutter/material.dart';

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
    return CardCaixaWidget(
      caixa: caixa,
      onTap: () {
        close(context, caixa);
      },
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
