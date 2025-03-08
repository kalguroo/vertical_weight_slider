import 'package:vertical_weight_slider/src/models/measurement_unit.dart';

extension MeasurementUnitExtension on MeasurementUnit {
  int get largePointerIndex {
    switch (this) {
      case MeasurementUnit.inch:
        return 12;
      default:
        return 10;
    }
  }

  int get mediumPointerIndex {
    switch (this) {
      case MeasurementUnit.inch:
        return 6;
      default:
        return 5;
    }
  }
}
