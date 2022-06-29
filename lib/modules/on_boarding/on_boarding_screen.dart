import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task1/modules/login/loginScreen.dart';
import 'package:task1/modules/sign_up/sign_up_screen.dart';
import 'package:task1/shared/components/components.dart';
import 'package:task1/shared/network/local/cashe_helper.dart';

class BoardingModel {
  final String image;
  final String title;
  final String explained;

  BoardingModel(
      {required this.image, required this.title, required this.explained});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/office1.png',
        title: 'Get food direct from our restaurant',
        explained: 'We have more than 15 branch in egypt'),
    BoardingModel(
        image: 'assets/road.png',
        title: 'Get Food delivery to your doorstep asap',
        explained:
            'We have young and professional delivery team that will bring your food as soon as possible to your doorstep'),
    BoardingModel(
        image: 'assets/fast.png',
        title: 'Get Food delivery to your doorstep asap',
        explained:
            'We have young and professional delivery team that will bring your food as soon as possible to your doorstep'),
  ];

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          const LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var boardController = PageController();
    bool isLast = false;

    return Scaffold(
        appBar: AppBar(actions: [
          SizedBox(
            height: 200.0,
            width: 100.0,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TextButton(
                      onPressed: () {
                        navigateAndFinish(context, const LoginScreen());
                      },
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ),
          )
        ]),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '7',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepOrange,
                  ),
                ),
                Text(
                  'Krave',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoarderItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 30.0, left: 30.0, top: 20.0),
              child: SmoothPageIndicator(
                controller: boardController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.deepOrange,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 3,
                    spacing: 10.0),
              ),
            ),
            InkWell(
              onTap: () {
                navigateAndFinish(context, const LoginScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, right: 10.0, left: 10.0, bottom: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  width: double.infinity,
                  height: 50.0,
                  child: const Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.black, fontSize: 15.0),
                  ),
                  TextButton(
                    onPressed: () {
                      navigateAndFinish(context, const SignUpScreen());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

Widget buildBoarderItem(BoardingModel model) => Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            model.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            model.explained,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 18.0,
                wordSpacing: 3,
                letterSpacing: 0),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
