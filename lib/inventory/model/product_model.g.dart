// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      isAvailable: json['isAvailable'] as bool,
      heroImageUrl: json['heroImageUrl'] as String,
      sampleImages: (json['sampleImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      basePrice: json['basePrice'] as int,
      description: json['description'] as String,
      providerId: json['providerId'] as String,
      maxOrderQuantity: json['maxOrderQuantity'] as int,
      ratingsCount: json['ratingsCount'] as int,
      rating: (json['rating'] as num).toDouble(),
      hasCustomisations: json['hasCustomisations'] as bool,
      customisations: (json['customisations'] as List<dynamic>?)
          ?.map((e) => CustomisationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isAvailable': instance.isAvailable,
      'heroImageUrl': instance.heroImageUrl,
      'sampleImages': instance.sampleImages,
      'basePrice': instance.basePrice,
      'description': instance.description,
      'providerId': instance.providerId,
      'maxOrderQuantity': instance.maxOrderQuantity,
      'ratingsCount': instance.ratingsCount,
      'rating': instance.rating,
      'hasCustomisations': instance.hasCustomisations,
      'customisations':
          instance.customisations?.map((e) => e.toJson()).toList(),
    };
