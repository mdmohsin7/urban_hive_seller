import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../entity/product.dart';
import 'customisation_model.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  final String id;
  final String name;
  final bool isAvailable;
  final String heroImageUrl;
  final List<String> sampleImages;
  final int basePrice;
  final String description;
  final String providerId;
  final int maxOrderQuantity;
  final int ratingsCount;
  final double rating;
  final bool hasCustomisations;
  final List<CustomisationModel>? customisations;

  ProductModel({
    required this.id,
    required this.name,
    required this.isAvailable,
    required this.heroImageUrl,
    required this.sampleImages,
    required this.basePrice,
    required this.description,
    required this.providerId,
    required this.maxOrderQuantity,
    required this.ratingsCount,
    required this.rating,
    required this.hasCustomisations,
    this.customisations,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['hasCustomisations']) {
      json['customisations'] = jsonDecode(json['customisations']);
    }
    if (json['rating'] == null) {
      json['rating'] = 0.0;
    }
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Product toDomain() => Product(
        id: id,
        name: name,
        isAvailable: isAvailable,
        heroImageUrl: heroImageUrl,
        sampleImages: [heroImageUrl, ...sampleImages],
        basePrice: basePrice,
        providerId: providerId,
        maxOrderQuantity: maxOrderQuantity,
        description: description,
        ratingsCount: ratingsCount,
        rating: rating,
        hasCustomisations: hasCustomisations,
        customisations: customisations?.map((e) => e.toDomain()).toList(),
      );
}
