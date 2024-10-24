import 'package:app_venda/src/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class FooterPaginationBar extends StatefulWidget {
  final int pageSize;
  final int paginaAtual;
  final int totalRegistros;
  final int pages;
  final int size;
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
    required this.size,
  });

  @override
  State<FooterPaginationBar> createState() => _FooterPaginationBarState();
}

class _FooterPaginationBarState extends State<FooterPaginationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavigationButton(
            icon: Icons.arrow_back,
            onPressed: () {
              if (widget.paginaAtual > 1) {
                widget.setPagAtual(widget.paginaAtual - 1);
              }
            },
            isDisabled: widget.paginaAtual == 1,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: _buildPageButtons(),
          ),
          _buildNavigationButton(
            icon: Icons.arrow_forward,
            onPressed: () {
              if (!widget.isLastPage) {
                widget.setPagAtual(widget.paginaAtual + 1);
              }
            },
            isDisabled: widget.isLastPage,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageButtons() {
    final List<_PaginaSelected> paginas = [];

    if (widget.totalRegistros == widget.pageSize) {
      paginas.add(const _PaginaSelected(pagina: '1', isSelected: true));
    } else {
      final int paginaInicial =
          (widget.paginaAtual - 1 > 0) ? widget.paginaAtual - 1 : 1;
      final int paginaFinal = (widget.paginaAtual + 1 < widget.pages)
          ? widget.paginaAtual + 1
          : widget.pages;

      for (int i = paginaInicial; i <= paginaFinal; i++) {
        paginas.add(_PaginaSelected(
          pagina: i.toString(),
          isSelected: i == widget.paginaAtual,
        ));
      }

      if (widget.pages > 3) {
        if (widget.paginaAtual > 2) {
          paginas.insert(
            0,
            const _PaginaSelected(pagina: '1..', isSelected: false),
          );
        }
        if (widget.paginaAtual < widget.pages - 1) {
          paginas.add(
              _PaginaSelected(pagina: '..${widget.pages}', isSelected: false));
        }
      }
    }

    return paginas.map((e) {
      return GestureDetector(
        onTap: () {
          if (e.pagina == '1..') {
            widget.setPagAtual(1);
          } else if (e.pagina == '..${widget.pages}') {
            widget.setPagAtual(widget.pages);
          } else {
            widget.setPagAtual(int.parse(e.pagina!));
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color:
                e.isSelected! ? ColorsApp.instance.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: e.isSelected!
                  ? ColorsApp.instance.primary
                  : Colors.grey.shade300,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  e.pagina.toString(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight:
                            e.isSelected! ? FontWeight.bold : FontWeight.normal,
                        color:
                            e.isSelected! ? Colors.white : Colors.grey.shade700,
                      ),
                ),
              ),
              Visibility(
                visible: e.isSelected!,
                child: Text(
                  widget.size.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isDisabled,
  }) {
    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDisabled ? Colors.grey[300] : ColorsApp.instance.primary,
        ),
        child: Icon(
          icon,
          color: isDisabled ? Colors.grey : Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

class _PaginaSelected {
  final String? pagina;
  final bool? isSelected;

  const _PaginaSelected({
    required this.pagina,
    required this.isSelected,
  });
}
