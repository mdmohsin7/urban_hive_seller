import 'package:json_annotation/json_annotation.dart';
import 'package:urban_hive_seller/orders/entity/customisation.dart';

part 'customisation_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomisationModel {
  final String customisationName;
  final String selectedCustomisationValue;
  final bool isPaid;
  final int? additionalCharge;

  CustomisationModel({
    required this.customisationName,
    required this.selectedCustomisationValue,
    required this.isPaid,
    this.additionalCharge,
  });

  factory CustomisationModel.fromJson(Map<String, dynamic> json) {
    return _$CustomisationModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomisationModelToJson(this);

  Customisation toDomain() => Customisation(
        customisationName: customisationName,
        selectedCustomisationValue: selectedCustomisationValue,
        isPaid: isPaid,
        additionalCharge: additionalCharge,
      );
}
