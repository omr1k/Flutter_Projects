import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_app/const.dart';
import 'package:real_estate_app/widgets/menu/contact_info.dart';
import 'package:real_estate_app/widgets/menu/goals.dart';

import 'logo.dart';


class SideMenuSction extends StatelessWidget {
  const SideMenuSction({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        // ignore: prefer_const_literals_to_create_immutables
        child: Column(children: [
          const Logo(),
          Expanded(child: SingleChildScrollView(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContactInfo(),
                Divider(),
                Goals(),
                Divider(),
                SizedBox(width: kDefaultPadding / 2,),
                TextButton(onPressed: () {}, 
                child: FittedBox(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/download.svg'),
                      SizedBox(width: kDefaultPadding / 1,),
                      Text(
                        'Download Brouchure',
                        style: TextStyle(
                          color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color
                        ),
                      )
                    ],
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding / 2),
                  color: kSecondaryColor,
                  child: Row(children: [
                    Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/linkedin.svg'),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/github.svg'),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/twitter.svg'),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset('assets/icons/dribble.svg'),
                          ),
                          Spacer(),
                  ]),
                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }
}

