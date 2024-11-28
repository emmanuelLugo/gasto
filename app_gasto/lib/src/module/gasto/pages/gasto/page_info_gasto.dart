import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_info_gasto.g.dart';

@JsonSerializable()
class PageInfoGasto<T> {
  final int total;

  final int pageNum;
  final int pageSize;
  final int size;
  final int startRow;
  final int endRow;
  final int pages;
  final bool isLastPage;
  final bool hasNextPage;
  List<Gasto>? list = [];

  PageInfoGasto({
    required this.total,
    this.list,
    required this.pageNum,
    required this.pageSize,
    required this.size,
    required this.startRow,
    required this.endRow,
    required this.pages,
    required this.isLastPage,
    required this.hasNextPage,
  });

  factory PageInfoGasto.fromJson(Map<String, dynamic> json) => _$PageInfoGastoFromJson(json);
  Map<String, dynamic> toJson() => _$PageInfoGastoToJson(this);
}
