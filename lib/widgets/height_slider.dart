import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class HeightSlider extends StatelessWidget {
  final void Function(double) onChanged;
  final double height;
  final WeightSliderController controller;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120 - 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffa292c6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 8),
                Text(
                  '${height.toStringAsFixed(0)} cm',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: VerticalWeightSlider(
              controller: controller,
              haptic: Haptic.heavyImpact,
              height: 10,
              diameterRatio: 1.5,
              isVertical: false,
              decoration: const PointerDecoration(
                width: 50.0,
                height: 2.0,
                largeColor: Color(0xFF898989),
                mediumColor: Color(0xFFC5C5C5),
                smallColor: Color(0xFFF0F0F0),
                gap: 10.0,
              ),
              onChanged: onChanged,
              indicator: Container(
                height: 2.0,
                width: 58.0,
                alignment: Alignment.center,
                color: const Color(0xffa292c6),
              ),
            ),
          )
        ],
      ),
    );
  }
}
