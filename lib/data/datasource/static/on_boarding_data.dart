import '../../models/on_boarding_data_model.dart';
import '../../../core/constants/app_img_constants.dart';

const List<OnBoardingDataModel> onboardingData = [
  OnBoardingDataModel(
    imgPath: AppImgConstants.kOnboardingImg1,
    title: "Welcome to FloraVision",
    subtitle: "AI-powered plant disease detection from your camera",
  ),
  OnBoardingDataModel(
    imgPath: AppImgConstants.kOnboardingImg2,
    title: "Capture Plant Photos",
    subtitle: "Take photos or use real-time camera to scan your plants",
  ),
  OnBoardingDataModel(
    imgPath: AppImgConstants.kOnboardingImg3,
    title: "Instant Disease Detection",
    subtitle: "Our AI analyzes your plants and identifies diseases instantly",
  ),
];
