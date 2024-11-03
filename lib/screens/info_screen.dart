import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final bool isMale;
  final double height;
  final double weight;
  final int age;
  final int activitylevel;
  const ResultScreen(
      {super.key,
      required this.isMale,
      required this.height,
      required this.weight,
      required this.age,
      required this.activitylevel});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Body info.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Body Mass Index (BMI)',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(162, 146, 198, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${bmiCategory(
                      bmiValue: bmiValue(
                        weight: widget.weight,
                        height: widget.height,
                      ),
                    )}: ${bmiValue(
                      weight: widget.weight,
                      height: widget.height,
                    )}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            //  Body Fat Percentage (BFP)
            Text(' Body Fat Percentage (BFP)',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(162, 146, 198, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${bfpCategory(
                      bfpValue: bfpValue(
                        bmi: bmiValue(
                          weight: widget.weight,
                          height: widget.height,
                        ),
                        age: widget.age,
                        isMale: widget.isMale,
                      ),
                      isMale: widget.isMale,
                    )}: ${"${bfpValue(
                      bmi: bmiValue(
                        weight: widget.weight,
                        height: widget.height,
                      ),
                      age: widget.age,
                      isMale: widget.isMale,
                    )} %"}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text('Lean Body Mass (LBM)',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(162, 146, 198, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${lbmValue(
                      weight: widget.weight,
                      height: widget.height,
                      isMale: widget.isMale,
                    )} kg',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),
            Text(
              'Total Energy Expenditure (TEE)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(162, 146, 198, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${teeValue(
                      activityLevel: widget.activitylevel,
                      bmrValue: bmrValue(
                        weight: widget.weight,
                        height: widget.height,
                        age: widget.activitylevel,
                        isMale: widget.isMale,
                      ),
                    )} kcal/day ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double bmiValue({required double weight, required double height}) {
  return double.parse((weight / pow(height / 100, 2)).toStringAsFixed(2));
}

String bmiCategory({required double bmiValue}) {
  if (bmiValue < 18.5) {
    return 'Underweight';
  } else if (18.5 <= bmiValue && bmiValue <= 24.9) {
    return 'Normal weight';
  } else if (25 <= bmiValue && bmiValue <= 29.9) {
    return 'Overweight';
  } else {
    return 'Obesity';
  }
}

double bfpValue({required double bmi, required int age, required bool isMale}) {
  return isMale
      ? double.parse((1.20 * bmi + 0.23 * age - 16.2).toStringAsFixed(2))
      : double.parse((1.20 * bmi + 0.23 * age - 5.4).toStringAsFixed(2));
}

String bfpCategory({required double bfpValue, required bool isMale}) {
  if (isMale) {
    if (2.00 <= bfpValue && bfpValue <= 5.00) {
      return 'Essential Fat';
    } else if (5.10 <= bfpValue && bfpValue <= 13.00) {
      return 'Athletes';
    } else if (13.10 <= bfpValue && bfpValue <= 17.00) {
      return 'Fitness';
    } else if (17.10 <= bfpValue && bfpValue <= 24.00) {
      return 'Acceptable';
    } else {
      return 'Obese';
    }
  } else {
    if (10 <= bfpValue && bfpValue <= 13) {
      return 'Essential Fat';
    } else if (13.1 <= bfpValue && bfpValue <= 20) {
      return 'Athletes';
    } else if (20.1 <= bfpValue && bfpValue <= 24) {
      return 'Fitness';
    } else if (24.1 <= bfpValue && bfpValue <= 31) {
      return 'Acceptable';
    } else {
      return 'Obese';
    }
  }
}

double lbmValue(
    {required double weight, required double height, required bool isMale}) {
  return isMale
      ? double.parse(
          ((0.407 * weight) + (0.267 * height) - 19.2).toStringAsFixed(2))
      : double.parse(
          ((0.252 * weight) + (0.473 * height) - 48.3).toStringAsFixed(2));
}

double bmrValue(
    {required double weight,
    required double height,
    required age,
    required bool isMale}) {
  return isMale
      ? double.parse(
          (88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age))
              .toStringAsFixed(3))
      : double.parse(
          (447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age))
              .toStringAsFixed(3));
}

double teeValue({required double bmrValue, required int activityLevel}) {
  if (activityLevel == 0) {
    return double.parse((bmrValue * 1.2).toStringAsFixed(2));
  } else if (activityLevel == 1) {
    return double.parse((bmrValue * 1.375).toStringAsFixed(2));
  } else if (activityLevel == 2) {
    return double.parse((bmrValue * 1.725).toStringAsFixed(2));
  } else if (activityLevel == 3) {
    return double.parse((bmrValue * 1.55).toStringAsFixed(2));
  } else {
    return double.parse((bmrValue * 1.9).toStringAsFixed(2));
  }
}
