import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_app/const.dart';

class Goals extends StatelessWidget {
  const Goals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          child: Text(
            'Goals',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        buildGoals(text: 'Planning stage'),
        buildGoals(text: 'Development'),
        buildGoals(text: 'Execution phase'),
        buildGoals(text: 'New way to living'),
      ],
    );
  }

  Padding buildGoals({required String text}) {
    return Padding(
        padding: const EdgeInsets.only(bottom: kDefaultPadding /2),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/check.svg'),
            SizedBox(width: kDefaultPadding /2),
            Text(text)
          ],
        ),
      );
  }
}