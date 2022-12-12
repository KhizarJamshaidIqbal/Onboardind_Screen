// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:onboarding_screen/View/screen/HomeScreen.dart';
import 'package:onboarding_screen/View/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../components/onboardingscreen_data.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

//for Dots...
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5.0),
      duration: Duration(milliseconds: 500),
      height: currentPage == index ? 12 : 10,
      width: currentPage == index ? 15 : 10,
      decoration: BoxDecoration(
          color: currentPage == index
              ? globalColors.SecondaryColor
              : globalColors.primaryColor,
          shape: BoxShape.circle),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Column(
            children: [
              currentPage > 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _pageController.previousPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: globalColors.textColor,
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  color: globalColors.textColor,
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 30, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  color: globalColors.textColor,
                                  fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: PageView.builder(
            controller: _pageController,
            itemCount: onboarding_data.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    width: 330,
                    child: Image(
                      image: AssetImage(
                        onboarding_data[index].image,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    onboarding_data[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    onboarding_data[index].Description,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: globalColors.textColor, fontSize: 15),
                  ),
                ],
              );
            },
          )),
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 40.0),
            child: Row(
              children: [
                Row(
                    children: List.generate(onboarding_data.length,
                        (index) => dotIndicator(index))),
                Spacer(),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            0.2,
                            1,
                          ],
                          colors: [
                            Color(0xfffbafa7),
                            Color(0xfffc5485)
                          ])),
                  child: TextButton(
                      onPressed: () {
                        if (currentPage == onboarding_data.length - 1) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        }
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
