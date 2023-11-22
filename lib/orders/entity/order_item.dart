import 'package:equatable/equatable.dart';

import 'customisation.dart';

class OrderItem extends Equatable {
  final String productId;
  final int quantity;
  final String productName;
  final int basePrice;
  final int customisationsCost;
  final bool hasCustomisations;
  final List<Customisation>? customisations;

  const OrderItem(
      {required this.productId,
      required this.quantity,
      required this.productName,
      required this.basePrice,
      required this.customisationsCost,
      required this.hasCustomisations,
      this.customisations});

  @override
  List<Object?> get props => [
        productId,
        quantity,
        productName,
        basePrice,
        hasCustomisations,
        customisationsCost,
        customisations,
      ];
}
