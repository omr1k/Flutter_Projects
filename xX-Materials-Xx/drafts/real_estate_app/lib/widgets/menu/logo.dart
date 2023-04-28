import 'package:flutter/material.dart';

import '../../const.dart';


class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1.23,
    child: Container(
      color: kSecondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Spacer(flex: 2,),
        Image(image: const AssetImage('assets/images/logo.png'),
        width: 100.0,
        ),
        Spacer(),
        Text("Real Estate", style: Theme.of(context).textTheme.titleMedium,),
        Text("Modren home with \n greate interior design",
        textAlign: TextAlign.center, 
        style: TextStyle(
          fontWeight: FontWeight.w200, height: 1.5,
        )),
        Spacer(flex: 2,),
      ]),
    ),
    );
  }
}