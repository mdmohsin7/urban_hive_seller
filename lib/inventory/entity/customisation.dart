import 'package:equatable/equatable.dart';

import 'customisation_option.dart';

class Customisation extends Equatable {
  final String customisationId;
  final String customisationName;
  final bool isAvailable;
  final int customisationType;
  final bool multipleSelect;
  final List<CustomisationOption>? customisationOptions;

  const Customisation({
    required this.customisationId,
    required this.customisationName,
    required this.isAvailable,
    required this.customisationType,
    this.customisationOptions,
    required this.multipleSelect,
  });
  @override
  List<Object?> get props => [
        customisationId,
        customisationName,
        isAvailable,
        customisationType,
        customisationOptions,
        multipleSelect,
      ];
}
