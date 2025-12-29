import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import '../constants/app_img_constants.dart';
import '../network/request_status.dart';

class RequestHandlerView extends StatelessWidget {
  const RequestHandlerView({
    super.key,
    required this.child,
    required this.status,
    this.onRetry,
  });

  final Widget child;
  final RequestStatus? status;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case RequestStatus.noData:
        return child;
      case RequestStatus.loading:
        return Center(child: Lottie.asset(AppImgConstants.kLottieLoading));
      case RequestStatus.failure:
        return _buildRetryView(AppImgConstants.kLottieFailure, "Try Again");
      case RequestStatus.serverFailure:
        return _buildRetryView(
          AppImgConstants.kLottieServerFailure,
          "Server Down",
        );
      case RequestStatus.offlineFailure:
        return _buildRetryView(AppImgConstants.kOffline, "Retry");
      default:
        return child;
    }
  }

  Widget _buildRetryView(String lottiePath, String buttonText) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(lottiePath),
          if (onRetry != null)
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF009689),
                foregroundColor: Colors.white,
              ),
              child: Text(buttonText),
            ),
        ],
      ),
    );
  }
}
