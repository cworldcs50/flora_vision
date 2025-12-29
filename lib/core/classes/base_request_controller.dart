import 'package:get/get.dart';
import '../functions/is_online.dart';
import '../../core/network/request_status.dart';

class BaseRequestController extends GetxController {
  final Rx<RequestStatus> requestStatus = RequestStatus.noData.obs;

  void setStatus(RequestStatus status) => requestStatus.value = status;

  Future<bool> checkOnline() async {
    final online = await isOnline();
    if (!online) {
      setStatus(RequestStatus.offlineFailure);
    }
    return online;
  }

  void onRetry() => setStatus(RequestStatus.noData);
}
