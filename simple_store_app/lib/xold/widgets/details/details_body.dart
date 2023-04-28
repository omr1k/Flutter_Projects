import 'package:flutter/material.dart';
import 'package:simple_store_app/constants.dart';
import 'package:simple_store_app/widgets/details/product_image.dart';

import 'color_dot.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              height: size.width * 0.8,
              // color: Colors.black,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ProductIamge(
                    size: size,
                    image: "images/airpod.png",
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        ColorDot(fillColor: Colors.green , isSelect: true,),
                         ColorDot(fillColor: Colors.red , isSelect: false,),
                          ColorDot(fillColor: Colors.red , isSelect: false,),
                        ],
                    ),
                  ),
                  Text("gsdfgds")
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
