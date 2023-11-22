import 'package:equatable/equatable.dart';

class CustomisationOption extends Equatable {
  final String optionId;
  final String optionName;
  final bool isAvailable;
  final bool isPaid;
  final int? additionalCharge;

  const CustomisationOption({
    required this.optionId,
    required this.optionName,
    required this.isAvailable,
    required this.isPaid,
    this.additionalCharge,
  }) : assert(isPaid == true ? additionalCharge != null : true);
  @override
  List<Object?> get props =>
      [optionId, optionName, isAvailable, isPaid, additionalCharge];
}
