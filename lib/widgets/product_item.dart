import 'package:ecommerce_project_main/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Image.asset('assets/images/iphone.png'),
              Positioned(
                top: 0,
                right: 10,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child:
                      Image.asset('assets/images/active_fav_product.png'),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(
                      '%4',
                      style: TextStyle(
                          fontFamily: 'sb',
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10,right: 10),
                child: Text(
                  'آیفون13 پرومکس',
                  style: TextStyle(fontFamily: 'sm', fontSize: 14),
                ),
              ),
              Container(
                height: 53,
                decoration: const BoxDecoration(
                  color: CustomColors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 25,
                      spreadRadius: -12,
                      offset: Offset(0.0, 15),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'تومان',
                        style: TextStyle(
                            fontFamily: 'sm',
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      const SizedBox(width: 5),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '48,800,000',
                            style: TextStyle(
                                fontFamily: 'sm',
                                color: Colors.white,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2.50,
                                decorationColor: Colors.white),
                          ),
                          Text(
                            '48,800,000',
                            style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/icon_right_arrow_cricle.png',
                        width: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
