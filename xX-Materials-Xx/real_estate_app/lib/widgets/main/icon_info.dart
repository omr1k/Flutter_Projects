import 'package:flutter/material.dart';
import 'package:real_estate_app/const.dart';
import 'package:real_estate_app/responsive.dart';

class IconInfo extends StatelessWidget {
  const IconInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding * 3),
      child: Responsive.isMobileLarg(context) ? 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconInfo(
            context: context,
            icon: Icons.supervisor_account,
            text: "964+", 
            lable: 'Clients'
          ),
          buildIconInfo(
            context: context,
            icon: Icons.supervisor_account,
            text: "964+", 
            lable: 'Clients'
          ),
          buildIconInfo(
            context: context,
            icon: Icons.supervisor_account,
            text: "964+", 
            lable: 'Clients'
          ),
          buildIconInfo(
            context: context,
            icon: Icons.supervisor_account,
            text: "964+", 
            lable: 'Clients'
          ),
        ],
      )
      :
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: buildIconInfo(
                  context: context,
                  icon: Icons.supervisor_account,
                  text: "964+", 
                  lable: 'Clients'
                ),
              ),
              Expanded(
                child: buildIconInfo(
                  context: context,
                  icon: Icons.supervisor_account,
                  text: "964+", 
                  lable: 'Clients'
                ),
              ),
            ],
          ),
          Row(
                children: [
                  Expanded(
                    child: buildIconInfo(
                                  context: context,
                                  icon: Icons.supervisor_account,
                                  text: "964+", 
                                  lable: 'Clients'
                                ),
                  ),
              Expanded(
                child: buildIconInfo(
                  context: context,
                  icon: Icons.supervisor_account,
                  text: "964+", 
                  lable: 'Clients'
                ),
              ),
                ],
              ),
        ],
      )
      ,
    );
  }

  Column buildIconInfo({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String lable,
    }) {
    return Column(
        children: [
          Icon(Icons.supervisor_account, size: 50.0,),
          SizedBox(height: 5.0,),
          Text(text,
          style: Theme.of(context)
          .textTheme.headlineMedium!.copyWith(color: kPrimaryColor, fontSize: 30),
          ),
          Text(lable, style: Theme.of(context).textTheme.titleMedium,)
        ],
      );
  }
}