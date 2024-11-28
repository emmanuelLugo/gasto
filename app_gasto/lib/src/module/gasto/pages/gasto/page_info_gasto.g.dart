// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info_gasto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageInfoGasto<T> _$PageInfoGastoFromJson<T>(Map<String, dynamic> json) =>
    PageInfoGasto<T>(
      total: (json['total'] as num).toInt(),
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Gasto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageNum: (json['pageNum'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      startRow: (json['startRow'] as num).toInt(),
      endRow: (json['endRow'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      isLastPage: json['isLastPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
    );

Map<String, dynamic> _$PageInfoGastoToJson<T>(PageInfoGasto<T> instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pageNum': instance.pageNum,
      'pageSize': instance.pageSize,
      'size': instance.size,
      'startRow': instance.startRow,
      'endRow': instance.endRow,
      'pages': instance.pages,
      'isLastPage': instance.isLastPage,
      'hasNextPage': instance.hasNextPage,
      'list': instance.list,
    };
