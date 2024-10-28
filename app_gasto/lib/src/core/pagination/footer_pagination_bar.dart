import 'package:app_gasto/src/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class FooterPaginationBar extends StatelessWidget {
  final int pageSize;
  final int paginaAtual;
  final int totalRegistros;
  final int pages;
  final bool isLastPage;
  final Function(int) setPagAtual;

  const FooterPaginationBar({
    super.key,
    required this.paginaAtual,
    required this.setPagAtual,
    required this.pageSize,
    required this.isLastPage,
    required this.totalRegistros,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        // color: Colors.grey.shade900,
        color: ColorsApp.instance.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRecordText(),
          _buildNavigationControls(),
        ],
      ),
    );
  }

  Widget _buildRecordText() {
    final startRecord = (paginaAtual - 1) * pageSize + 1;
    final endRecord = paginaAtual * pageSize > totalRegistros
        ? totalRegistros
        : paginaAtual * pageSize;

    return Text(
      '$startRecord - $endRecord de $totalRegistros registros',
      style: _textStyle(color: Colors.white70),
    );
  }

  Widget _buildNavigationControls() {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: paginaAtual == 1 ? Colors.grey : Colors.white,
          ),
          onPressed:
              paginaAtual == 1 ? null : () => setPagAtual(paginaAtual - 1),
        ),
        Text(
          'Página $paginaAtual de $pages',
          style: _textStyle(color: Colors.white),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_forward,
            color: isLastPage ? Colors.grey : Colors.white,
          ),
          onPressed: isLastPage ? null : () => setPagAtual(paginaAtual + 1),
        ),
      ],
    );
  }

  TextStyle _textStyle({required Color color, double fontSize = 14}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
    );
  }
}
