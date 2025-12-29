import 'package:flutter/material.dart';
import '../../../data/datasource/static/on_boarding_data.dart';
import 'onboarding_body.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.next,
  });

  final PageController pageController;
  final void Function(int) onPageChanged;
  final void Function() next;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      padEnds: false,
      itemCount: onboardingData.length,
      physics: const ClampingScrollPhysics(),
      scrollBehavior: const ScrollBehavior(),
      controller: pageController,

      onPageChanged: (index) => onPageChanged(index),
      itemBuilder:
          (context, index) => CustomOnBoardingBody(
            next: next,
            title: onboardingData[index].title,
            imgPath: onboardingData[index].imgPath,
            description: onboardingData[index].subtitle,
          ),
    );
  }
}
