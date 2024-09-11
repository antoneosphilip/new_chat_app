import 'package:christy/core/networking/api_error_handler.dart';
import 'package:christy/core/networking/api_result.dart';
import 'package:christy/features/home/data/api_service/singlar_service.dart';

class CheckServerConnection {
  static Future<bool> checkServerConnection() async {
    if (!SignalRService.isConnected) {
      try {
       await SignalRService.initializeConnection();
      } catch (error) {
        return false;
      }
    }
    return true;
  }
}
