import 'package:ecommerce_project_main/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Container(
                  color: Colors.red,
                  height: 200,
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: const ExpandingDotsEffect(
            expansionFactor: 4,
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Colors.white,
            activeDotColor: CustomColors.blueIndicator,
          ),
        ),
      ],
    );
  }
}
