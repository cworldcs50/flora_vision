import 'package:equatable/equatable.dart';

class OnBoardingDataModel extends Equatable {
  const OnBoardingDataModel({
    required this.title,
    required this.imgPath,
    required this.subtitle,
  });

  final String imgPath, title, subtitle;

  @override
  List<Object?> get props => [imgPath, subtitle, title];
}
