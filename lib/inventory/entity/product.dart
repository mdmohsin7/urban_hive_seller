import 'package:equatable/equatable.dart';

import 'customisation.dart';

class Product extends Equatable {
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
  final List<Customisation>? customisations;

  const Product({
    required this.id,
    required this.name,
    required this.isAvailable,
    required this.heroImageUrl,
    required this.sampleImages,
    required this.basePrice,
    required this.providerId,
    required this.maxOrderQuantity,
    required this.description,
    required this.ratingsCount,
    required this.rating,
    required this.hasCustomisations,
    this.customisations,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        isAvailable,
        heroImageUrl,
        sampleImages,
        basePrice,
        ratingsCount,
        rating,
        providerId,
        maxOrderQuantity
      ];
}
