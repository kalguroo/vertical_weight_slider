import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/src/widgets/weight_pointer.dart';

import '../vertical_weight_slider.dart';

class VerticalWeightSlider extends StatelessWidget {
  const VerticalWeightSlider({
    Key? key,
    required this.controller,
    this.height = 250,
    this.width = 200,
    this.decoration = const PointerDecoration(),
    this.indicator,
    required this.onChanged,
    this.isVertical = true,
    this.haptic = Haptic.none,
    this.diameterRatio = 3.0,
    this.unit = MeasurementUnit.kg,
    this.isMediumPointer = false,
    this.reversed = false,
  }) : super(key: key);

  /// A controller for scroll views whose items have the same size.
  final WeightSliderController controller;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  final double width;

  /// Pointer configuration
  final PointerDecoration decoration;

  /// Describes the configuration for a vertical weight slider.
  final Widget? indicator;

  /// On optional listener that's called when the centered item changes.
  final ValueChanged<double> onChanged;

  /// A Boolean value that indicates whether the slider is vertical.
  final bool isVertical;

  /// Allows access to the haptic feedback interface on the device.
  final Haptic haptic;

  /// A ratio between the diameter of the cylinder and the viewport's size in the main axis.
  final double diameterRatio;

  final MeasurementUnit unit;

  final bool isMediumPointer;

  final bool reversed;

  double selectedWeight(int index) => reversed ? controller.maxWeight - (index * controller.interval) :
      controller.minWeight + (index * controller.interval);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RotatedBox(
        quarterTurns: isVertical ? 0 : 1,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            ListWheelScrollView.useDelegate(
              // itemExtent: isVertical ? controller.itemExtent : controller.itemExtent + 9,
              itemExtent: controller.itemExtent ,
              diameterRatio: diameterRatio,
              controller: controller,
              physics: const FixedExtentScrollPhysics(),
              perspective: 0.00000000000000001,
              // perspective: 0.01,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: controller.markCount,
                builder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (index % unit.largePointerIndex == 0) 
                        // RotatedBox(
                          // quarterTurns: isVertical ? 0 : 3,
                          // child:
                           Text(
                            selectedWeight(index).toStringAsFixed(0),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: decoration.largeColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        // ),
                        
                        
                      if (index % unit.largePointerIndex == 0) 
                        WeightPointer(
                          color: decoration.largeColor,
                          width: decoration.width,
                          height: decoration.height,
                        ) 
                      else if (index % unit.mediumPointerIndex == 0 && isMediumPointer) 
                        WeightPointer(
                          color: decoration.mediumColor,
                          width: decoration.width - decoration.gap,
                          height: decoration.height - 1,
                        )
                      else 
                        WeightPointer(
                          color: decoration.smallColor,
                          width: decoration.width - (decoration.gap * 2),
                          height: decoration.height - 1,
                        ),
                      
                    ]
                  );
                  
                },
              ),
              onSelectedItemChanged: (index) {
                onChanged(selectedWeight(index));
                haptic.run();
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: indicator ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
