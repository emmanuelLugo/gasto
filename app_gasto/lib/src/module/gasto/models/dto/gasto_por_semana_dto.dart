import 'package:json_annotation/json_annotation.dart';

part 'gasto_por_semana_dto.g.dart';

@JsonSerializable()
class GastoPorSemanaDto {
  double? vlTotal;
  int? diasDaSemana;
  String? diasDaSemanaString;

  GastoPorSemanaDto({
    this.vlTotal,
    this.diasDaSemana,
    this.diasDaSemanaString,
  });

  factory GastoPorSemanaDto.fromJson(Map<String, dynamic> json) =>
      _$GastoPorSemanaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GastoPorSemanaDtoToJson(this);

  GastoPorSemanaDto copyWith({
    double? vlTotal,
    int? diasDaSemana,
    String? diasDaSemanaString,
  }) {
    return GastoPorSemanaDto(
      vlTotal: vlTotal ?? this.vlTotal,
      diasDaSemana: diasDaSemana ?? this.diasDaSemana,
      diasDaSemanaString: diasDaSemanaString ?? this.diasDaSemanaString,
    );
  }
}
