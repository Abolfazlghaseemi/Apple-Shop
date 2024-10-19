import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_project_main/constants/colors.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 44, right: 44, bottom: 32, top: 32),
                  child: Container(
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Image.asset('assets/images/icon_apple_blue.png'),
                        const Expanded(
                          child: Text(
                            textAlign: TextAlign.center,
                            'سبد خرید',
                            style: TextStyle(
                              fontFamily: 'sb',
                              fontSize: 16,
                              color: CustomColors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return cardIteam();
                }, childCount: 10),
              ),
              SliverPadding(
                padding: EdgeInsets.only(bottom: 60),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
            child: SizedBox(
              height: 53,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                      fontSize: 18, fontFamily: 'sm', color: Colors.white),
                  backgroundColor: CustomColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'ادامه فرایند خرید',
                  style: TextStyle(
                      fontSize: 18, fontFamily: 'sm', color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class cardIteam extends StatelessWidget {
  const cardIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249,
      margin: const EdgeInsets.only(left: 44, right: 44, bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '1',
                                      style: TextStyle(
                                          fontFamily: 'sb', fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      'گارانتی فیلان ۱۸ ماهه',
                                      style: TextStyle(
                                          fontFamily: 'sm', fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 6),
                                            child: Text(
                                              '%4',
                                              style: TextStyle(
                                                  fontFamily: 'sb',
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text('تومان'),
                                        const Text('49.123.123'),
                                      ],
                                    ),
                                    Wrap(
                                      children: [
                                        optionCheap(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.asset('assets/images/iphone.png'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DottedLine(
                            lineLength: MediaQuery.of(context).size.width * 0.8,
                            dashLength: 8.0,
                            dashColor: CustomColors.gery.withOpacity(0.5),
                            dashGapLength: 3.0,
                            dashGapColor: Colors.transparent,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('تومان'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('59.000.000'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class optionCheap extends StatelessWidget {
  const optionCheap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.gery, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/icon_options.png'),
            SizedBox(width: 10),
            Text('1111'),
          ],
        ),
      ),
    );
  }
}
