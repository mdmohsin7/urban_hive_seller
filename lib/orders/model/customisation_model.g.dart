// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomisationModel _$CustomisationModelFromJson(Map<String, dynamic> json) =>
    CustomisationModel(
      customisationName: json['customisationName'] as String,
      selectedCustomisationValue: json['selectedCustomisationValue'] as String,
      isPaid: json['isPaid'] as bool,
      additionalCharge: json['additionalCharge'] as int?,
    );

Map<String, dynamic> _$CustomisationModelToJson(CustomisationModel instance) =>
    <String, dynamic>{
      'customisationName': instance.customisationName,
      'selectedCustomisationValue': instance.selectedCustomisationValue,
      'isPaid': instance.isPaid,
      'additionalCharge': instance.additionalCharge,
    };
