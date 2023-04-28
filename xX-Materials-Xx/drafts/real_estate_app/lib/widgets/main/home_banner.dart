import 'package:flutter/material.dart';
import 'package:real_estate_app/const.dart';
import 'package:real_estate_app/responsive.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 1 : 1.7,
      child: Stack(
        fit: StackFit.expand,
        children: [
        Image.asset('assets/images/background.jpg', fit: BoxFit.cover,),
        Container(
          color: kDarkColor.withOpacity(0.3),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Build a greate future \n for all of us!',
                style: Responsive.isDesktop(context) ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,fontWeight: FontWeight.bold
                )
                : Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 2,
                    vertical: kDefaultPadding,
                  ),
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {},child:  Text('Contact Us', style:TextStyle(color: kDarkColor),),)
            ],
          ),
        )
      ],),
    );
  }
}