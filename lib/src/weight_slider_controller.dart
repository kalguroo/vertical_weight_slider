import 'package:flutter/cupertino.dart';

class WeightSliderController extends FixedExtentScrollController {
  WeightSliderController({
    double initialWeight = 0.0,
    int maxWeight = 300,
    int minWeight = 0,
    double itemExtent = 17.0,
    double interval = 1.0,
    bool reversed = false,
  })  : this.initialWeight = initialWeight,
        this.maxWeight = maxWeight,
        this.minWeight = minWeight,
        this.itemExtent = itemExtent,
        this.interval = interval,
        this.reversed = reversed,
        assert(maxWeight >= 0),
        assert(minWeight >= 0),
        assert(itemExtent >= 0),
        super(
          initialItem: reversed ? (maxWeight - initialWeight) ~/ interval : (initialWeight - minWeight) ~/ interval,
        );

  /// The page to show when first creating the scroll view.
  ///
  /// Defaults to 0 and must not be null.
  final double initialWeight;

  /// Maximum weight that the slider can be scrolled
  final int maxWeight;

  /// Minimum weight that the slider can be scrolled
  final int minWeight;

  /// Size of each child in the main axis
  final double itemExtent;

  /// Gap value according to scale type.
  final double interval;

  final bool reversed;

  int getIntervalToInt() => interval.toInt();

  int get markCount => (maxWeight - minWeight) ~/ interval + 1;

  /// Changes which item index is centered in the controlled scroll view.
  @override
  void jumpToItem(int weight) {
    super.jumpToItem((weight - minWeight) ~/ interval);
  }

  @override
  void jumpTo(double weight) {
    super.jumpTo(itemExtent * (weight - minWeight) / interval);
  }
}
