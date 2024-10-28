import 'package:app_gasto/src/module/gasto/models/gasto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_info_generic.g.dart';

@JsonSerializable()
class PageInfoGeneric<T> {
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

  PageInfoGeneric({
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

  factory PageInfoGeneric.fromJson(Map<String, dynamic> json) =>
      _$PageInfoGenericFromJson(json);
  Map<String, dynamic> toJson() => _$PageInfoGenericToJson(this);
}
