import 'package:casapp/src/classes/providers/service/service_provider_protocol.dart';
import 'package:casapp/src/classes/services/api/homes_api_service.dart';
import '../../services/api/firebase_api_service.dart';

class ServiceProvider implements ServiceProviderProtocol {
  @override
  FirebaseAPIService firebaseAPIService() {
    return FirebaseAPIService();
  }

  @override
  HomesAPIService homesAPIService() {
    return HomesAPIService();
  }
}
