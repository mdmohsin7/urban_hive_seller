import 'package:json_annotation/json_annotation.dart';

import '../entity/customisation_option.dart';

part 'customisation_option_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomisationOptionModel {
  final String optionId;
  final String optionName;
  final bool isAvailable;
  final bool isPaid;
  final int? additionalCharge;

  const CustomisationOptionModel({
    required this.optionId,
    required this.optionName,
    required this.isAvailable,
    required this.isPaid,
    this.additionalCharge,
  });

  factory CustomisationOptionModel.fromJson(Map<String, dynamic> json) {
    return _$CustomisationOptionModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomisationOptionModelToJson(this);

  CustomisationOption toDomain() => CustomisationOption(
        optionId: optionId,
        optionName: optionName,
        isAvailable: isAvailable,
        isPaid: isPaid,
        additionalCharge: additionalCharge,
      );
}
