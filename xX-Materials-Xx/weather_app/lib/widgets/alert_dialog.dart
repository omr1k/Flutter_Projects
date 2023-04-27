import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Constants/app_colors.dart';
import 'package:weather_app/models/weatherProvider.dart';

class InvalidCityDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Invalid City'),
      content: Text('The city you entered is not valid. Please try again.'),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pop();
            Provider.of<WeatherProvider>(context, listen: false)
                .toggleIsError();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                AppColors.iOSDefultBlue, // set the button color to green
          ),
          child: Text('OK'),
        ),
      ],
    );
  }
}
