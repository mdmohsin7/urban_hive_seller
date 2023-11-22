// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customisation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomisationModel _$CustomisationModelFromJson(Map<String, dynamic> json) =>
    CustomisationModel(
      customisationId: json['customisationId'] as String,
      customisationName: json['customisationName'] as String,
      isAvailable: json['isAvailable'] as bool,
      customisationType: json['customisationType'] as int,
      customisationOptions: (json['customisationOptions'] as List<dynamic>?)
          ?.map((e) =>
              CustomisationOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      multipleSelect: json['multipleSelect'] as bool,
    );

Map<String, dynamic> _$CustomisationModelToJson(CustomisationModel instance) =>
    <String, dynamic>{
      'customisationId': instance.customisationId,
      'customisationName': instance.customisationName,
      'isAvailable': instance.isAvailable,
      'customisationType': instance.customisationType,
      'multipleSelect': instance.multipleSelect,
      'customisationOptions':
          instance.customisationOptions?.map((e) => e.toJson()).toList(),
    };
