// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customisation_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomisationOptionModel _$CustomisationOptionModelFromJson(
        Map<String, dynamic> json) =>
    CustomisationOptionModel(
      optionId: json['optionId'] as String,
      optionName: json['optionName'] as String,
      isAvailable: json['isAvailable'] as bool,
      isPaid: json['isPaid'] as bool,
      additionalCharge: json['additionalCharge'] as int?,
    );

Map<String, dynamic> _$CustomisationOptionModelToJson(
        CustomisationOptionModel instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'optionName': instance.optionName,
      'isAvailable': instance.isAvailable,
      'isPaid': instance.isPaid,
      'additionalCharge': instance.additionalCharge,
    };
