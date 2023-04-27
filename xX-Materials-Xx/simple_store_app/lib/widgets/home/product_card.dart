import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.itemIndex,
      required this.product,
      required this.press});

  final int itemIndex;
  final Product product;
  // final Function press;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 190.0,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 160.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 15),
                        blurRadius: 25,
                        color: Colors.black.withOpacity(0.7)),
                  ]),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 160,
                width: 200,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: SizedBox(
                height: 136,
                width: size.width - 200,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Text(
                          product.title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding),
                        child: Text(
                          product.subTitle,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(kDefaultPadding),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding * 1.5,
                              vertical: kDefaultPadding / 5),
                          decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(22)),
                          child: Text('السعر: \$${product.price}'),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
