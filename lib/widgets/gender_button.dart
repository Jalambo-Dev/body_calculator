import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String genderType;
  final void Function()? onTap;
  final Color color;

  const GenderButton({
    super.key,
    required this.icon,
    required this.genderType,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: Material(
        color: color, // background color for the InkWell
        borderRadius: BorderRadius.circular(10), // apply border radius here
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 28,
              ),
              Text(
                genderType,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
