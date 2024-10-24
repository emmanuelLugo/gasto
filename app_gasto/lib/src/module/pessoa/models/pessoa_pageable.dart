import 'package:app_gasto/src/module/pessoa/models/pessoa.dart';
import 'package:mobx/mobx.dart';

class PessoaPageable {
  int? total;
  ObservableList<Pessoa>? pessoas;
  int? pageNum;
  int? pageSize;
  int? size;
  int? startRow;
  int? endRow;
  int? pages;
  int? prePage;
  int? nextPage;
  bool isFirstPage = false;
  bool isLastPage = false;
  bool? hasPreviousPage;
  bool? hasNextPage;
  int? navigatePages;
  List<int>? navigatepageNums;
  int? navigateFirstPage;
  int? navigateLastPage;

  PessoaPageable(
      {this.total,
      this.pessoas,
      this.pageNum,
      this.pageSize,
      this.size,
      this.startRow,
      this.endRow,
      this.pages,
      this.prePage,
      this.nextPage,
      this.isFirstPage = false,
      this.isLastPage = false,
      this.hasPreviousPage,
      this.hasNextPage,
      this.navigatePages,
      this.navigatepageNums,
      this.navigateFirstPage,
      this.navigateLastPage});

  PessoaPageable.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      pessoas = ObservableList<Pessoa>();
      json['list'].forEach((v) {
        pessoas!.add(Pessoa.fromJson(v));
      });
    }
    pageNum = json['pageNum'];
    pageSize = json['pageSize'] + 1 ?? 0;
    size = json['size'];
    startRow = json['startRow'];
    endRow = json['endRow'];
    pages = json['pages'];
    prePage = json['prePage'];
    nextPage = json['nextPage'];
    isFirstPage = json['isFirstPage'] ?? false;
    isLastPage = json['isLastPage'] ?? false;
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    navigatePages = json['navigatePages'];
    navigatepageNums = json['navigatepageNums'].cast<int>();
    navigateFirstPage = json['navigateFirstPage'];
    navigateLastPage = json['navigateLastPage'];
  }
}
