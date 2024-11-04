import 'package:mobx/mobx.dart';

part 'pagination.g.dart';

class Pagination = PaginationBase with _$Pagination;

abstract class PaginationBase with Store {
  @observable
  bool isLastPage = false;

  @observable
  int pageNr = 1;

  @observable
  int pageSize = 10;

  @observable
  int pageTotal = 0;

  @observable
  int size = 0;

  @observable
  int pages = 0;

  @observable
  int totalRegistros = 0;

  PaginationBase({
    this.isLastPage = false,
    this.pageNr = 1,
    this.pageSize = 10,
    this.pageTotal = 0,
    this.size = 0,
    this.pages = 0,
    this.totalRegistros = 0,
  });

  void setPaginaAtual(int page) {
    pageNr = page;
  }
}
