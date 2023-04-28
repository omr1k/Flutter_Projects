import 'package:flutter/material.dart';
import 'package:simple_store_app/widgets/details/color_dot.dart';
import '../../constants.dart';
import '../../models/product.dart';
import 'product_image.dart';

class DetailsBody extends StatelessWidget {
 final Product product;

  const DetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // to provide us the height and the width of the sceen
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ProductIamge (
                  size: size,
                  image: product.image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ColorDot(
                      fillColor: kTextLightColor,
                      isSelect: true,
                    ),
                    ColorDot(
                      fillColor: Colors.blue,
                      isSelect: false,
                    ),
                    ColorDot(
                      fillColor: Colors.red,
                      isSelect: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                'السعر: \$${product.price}',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5,
            vertical: kDefaultPadding / 2,
          ),
          child: Text(
            product.description,
            style: TextStyle(color: Colors.white, fontSize: 19.0),
          ),
        ),
      ],
    );
  }
}





















// import 'package:flutter/material.dart';
// import 'package:simple_store_app/constants.dart';
// import 'package:simple_store_app/widgets/details/product_image.dart';

// import 'color_dot.dart';

// class DetailsBody extends StatelessWidget {
//   const DetailsBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(50))),
//           child: Column(children: [
//             Container(
//               margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
//               height: size.width * 0.8,
//               // color: Colors.black,
//               child: Stack(
//                 alignment: Alignment.bottomCenter,
//                 children: [
//                   ProductIamge(
//                     size: size,
//                     image: "images/airpod.png",
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: kDefaultPadding),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                         ColorDot(fillColor: Colors.green , isSelect: true,),
//                          ColorDot(fillColor: Colors.red , isSelect: false,),
//                           ColorDot(fillColor: Colors.red , isSelect: false,),
//                         ],
//                     ),
//                   ),
//                   Text("gsdfgds")
//                 ],
//               ),
//             )
//           ]),
//         )
//       ],
//     );
//   }
// }
