import 'package:equatable/equatable.dart';

class Customisation extends Equatable {
  final String customisationName;
  final String selectedCustomisationValue;
  final bool isPaid;
  final int? additionalCharge;

  const Customisation(
      {required this.customisationName,
      required this.selectedCustomisationValue,
      required this.isPaid,
      this.additionalCharge});

  @override
  List<Object?> get props => [
        customisationName,
        selectedCustomisationValue,
        isPaid,
        additionalCharge,
      ];
}
