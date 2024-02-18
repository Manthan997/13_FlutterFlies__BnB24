import 'package:flutter/material.dart';
import 'package:health_tech/constants.dart';
import 'package:health_tech/screens/appointment.dart';
import 'package:health_tech/screens/custom_icon_button.dart';
import 'package:health_tech/screens/custom_indicator.dart';
import 'package:health_tech/screens/custom_text_button.dart';
import 'package:health_tech/screens/homepage.dart';
import 'package:health_tech/screens/loginPage.dart';
import 'package:health_tech/screens/on_boarding_card.dart';
import 'package:health_tech/screens/on_boarding_list.dart';
import 'package:health_tech/screens/primary_button.dart';
import 'package:health_tech/screens/sign_up.dart';
import 'package:health_tech/screens/wave_card.dart';

class EdenOnboardingView extends StatefulWidget {
  const EdenOnboardingView({
    Key? key,
  }) : super(key: key);

  @override
  State<EdenOnboardingView> createState() => _EdenOnboardingViewState();
}

class _EdenOnboardingViewState extends State<EdenOnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      extendBodyBehindAppBar: true,
      appBar: _currentIndex > 0
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 70,
              leading: Padding(
                padding: const EdgeInsets.all(7),
                child: CustomIconButton(
                  onTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  icon: '',
                ),
              ),
            )
          : null,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              WaveCard(),
              Positioned(
                top: 100,
                child: Image.asset(onboardingList[_currentIndex].image),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingList.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingCard(
                  onboarding: onboardingList[index],
                );
              },
            ),
          ),
          CustomIndicator(
            controller: _pageController,
            dotsLength: onboardingList.length,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              onTap: () {
                if (_currentIndex == (onboardingList.length - 1)) {
                  // Handle last page action
                  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInView()),
      );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              text: _currentIndex == (onboardingList.length - 1)
                  ? 'Get Started'
                  : 'Continue',
            ),
          ),
          CustomTextButton(
            onPressed: () {
              if (_currentIndex == (onboardingList.length - 1)) {
                // Handle 'Get Started' button action
                 Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogInView()),
      );
              } else {
                // Handle 'Skip' button action
                // return animateToPage((onboardingList.length - 1), duration: duration, curve: curve);
                _pageController.jumpToGivenPage(
                    page:  (onboardingList.length - 1),
                    duration: const Duration(milliseconds: 010),
                    curve: Curves.ease,
                  );
              }
            },
            text: _currentIndex == (onboardingList.length - 1)
                ? 'Sign in instead'
                : 'Skip',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
