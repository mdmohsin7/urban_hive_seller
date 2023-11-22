import 'package:json_annotation/json_annotation.dart';

import '../entity/customisation.dart';
import 'customisation_option_model.dart';

part 'customisation_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomisationModel {
  final String customisationId;
  final String customisationName;
  final bool isAvailable;
  final int customisationType;
  final bool multipleSelect;
  final List<CustomisationOptionModel>? customisationOptions;

  const CustomisationModel({
    required this.customisationId,
    required this.customisationName,
    required this.isAvailable,
    required this.customisationType,
    this.customisationOptions,
    required this.multipleSelect,
  });

  factory CustomisationModel.fromJson(Map<String, dynamic> json) {
    return _$CustomisationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomisationModelToJson(this);

  Customisation toDomain() => Customisation(
        customisationId: customisationId,
        customisationName: customisationName,
        isAvailable: isAvailable,
        customisationType: customisationType,
        customisationOptions:
            customisationOptions?.map((e) => e.toDomain()).toList(),
        multipleSelect: multipleSelect,
      );
}
