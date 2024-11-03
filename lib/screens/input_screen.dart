import 'dart:developer';

import 'package:body_calculator/screens/info_screen.dart';
import 'package:body_calculator/widgets/activity_level_button.dart';
import 'package:body_calculator/widgets/age_slider.dart';
import 'package:body_calculator/widgets/gender_button.dart';
import 'package:body_calculator/widgets/height_slider.dart';
import 'package:body_calculator/widgets/title_of_input_widget.dart';
import 'package:body_calculator/widgets/weight_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late WeightSliderController _weightController;
  late WeightSliderController _heightController;
  late WeightSliderController _ageController;

  bool isMale = true;
  double height = 170;
  double weight = 80;
  double age = 22;
  int level = 2;

  List<String> activityLevelTitle = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Super Active'
  ];
  List<String> activityLevelSubTitle = [
    'little or no exercise',
    'light exercise / sports 1-3 days/week',
    'moderate exercise / sports 3-5 days/week',
    'hard exercise / sports 6-7 days/week',
    'very hard exercise / physical job & sports 2X'
  ];

  @override
  void initState() {
    super.initState();
    _weightController = WeightSliderController(
      initialWeight: weight,
      minWeight: 30,
      interval: 1,
      maxWeight: 200,
      itemExtent: 12,
    );
    _heightController = WeightSliderController(
      initialWeight: height,
      minWeight: 140,
      interval: 1,
      maxWeight: 210,
      itemExtent: 12,
    );
    _ageController = WeightSliderController(
      initialWeight: age,
      minWeight: 18,
      interval: 1,
      maxWeight: 100,
      itemExtent: 12,
    );
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text(
          'Body Calculator',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 18),
              Row(
                children: [
                  // Gender
                  Expanded(
                    child: Column(
                      children: [
                        const TitleOfInputWidget(
                          icon: Icons.person,
                          title: 'Gender',
                        ),
                        const SizedBox(height: 8),

                        // Male
                        GenderButton(
                          icon: Icons.male,
                          genderType: 'Male',
                          onTap: () => setState(() => isMale = true),
                          color: isMale
                              ? const Color(0xffa292c6)
                              : const Color(0xff1c1c22),
                        ),

                        const SizedBox(height: 8),

                        // Female
                        GenderButton(
                          icon: Icons.female,
                          genderType: 'Female',
                          onTap: () => setState(() => isMale = false),
                          color: !isMale
                              ? const Color(0xffa292c6)
                              : const Color(0xff1c1c22),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Age
                  Expanded(
                    child: Column(
                      children: [
                        const TitleOfInputWidget(
                          title: 'Age',
                          icon: Icons.calendar_month_rounded,
                        ),
                        const SizedBox(height: 8),
                        AgeSlider(
                          age: age,
                          onChanged: (value) => setState(() => age = value),
                          controller: _ageController,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 18),

              Row(
                children: [
                  // Height
                  Expanded(
                    child: Column(
                      children: [
                        const TitleOfInputWidget(
                          title: 'Height',
                          icon: Icons.height,
                        ),
                        const SizedBox(height: 8),
                        HeightSlider(
                          controller: _heightController,
                          height: double.parse(height.toStringAsFixed(2)),
                          onChanged: (value) => setState(() =>
                              height = double.parse(value.toStringAsFixed(2))),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Weight
                  Expanded(
                    child: Column(
                      children: [
                        const TitleOfInputWidget(
                          title: 'Weight',
                          icon: Icons.balance,
                        ),
                        const SizedBox(height: 8),
                        WeightSlider(
                          weight: double.parse(weight.toStringAsFixed(2)),
                          controller: _weightController,
                          onChanged: (value) => setState(() =>
                              weight = double.parse(value.toStringAsFixed(2))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // Activity Level
              const TitleOfInputWidget(
                title: 'Activity Level',
                icon: Icons.bolt,
              ),
              const SizedBox(height: 8),

              ActivityLevelButton(
                levelTypeTitle: activityLevelTitle[0],
                levelTypesubTile: activityLevelSubTitle[0],
                onTap: () {
                  setState(() {
                    level = 0;
                  });
                },
                color: level == 0
                    ? const Color(0xffa292c6)
                    : const Color(0xff1c1c22),
              ),
              ActivityLevelButton(
                levelTypeTitle: activityLevelTitle[1],
                levelTypesubTile: activityLevelSubTitle[1],
                onTap: () => setState(() => level = 1),
                color: level == 1
                    ? const Color(0xffa292c6)
                    : const Color(0xff1c1c22),
              ),
              ActivityLevelButton(
                levelTypeTitle: activityLevelTitle[2],
                levelTypesubTile: activityLevelSubTitle[2],
                onTap: () => setState(() => level = 2),
                color: level == 2
                    ? const Color(0xffa292c6)
                    : const Color(0xff1c1c22),
              ),
              ActivityLevelButton(
                levelTypeTitle: activityLevelTitle[3],
                levelTypesubTile: activityLevelSubTitle[3],
                onTap: () => setState(() => level = 3),
                color: level == 3
                    ? const Color(0xffa292c6)
                    : const Color(0xff1c1c22),
              ),
              ActivityLevelButton(
                levelTypeTitle: activityLevelTitle[4],
                levelTypesubTile: activityLevelSubTitle[4],
                onTap: () => setState(() => level = 4),
                color: level == 4
                    ? const Color(0xffa292c6)
                    : const Color(0xff1c1c22),
              ),

              const SizedBox(height: 18),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xff2e2b38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // TODO: Calculate and Navigate to result screen
                  log("Gender:$isMale Weight:$weight Height:$height Age:$age ActivityLevel:$level");
                  height = double.parse(height.toStringAsFixed(2));
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ResultScreen(
                        isMale: isMale,
                        height: double.parse(height.toStringAsFixed(2)),
                        weight: double.parse(weight.toStringAsFixed(2)),
                        age: age.toInt(),
                        activitylevel: level,
                      ),
                    ),
                  );
                },
                child: Text(
                  'CALCULATE',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
