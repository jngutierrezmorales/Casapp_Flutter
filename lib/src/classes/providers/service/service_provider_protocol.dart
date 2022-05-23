import 'package:casapp/src/classes/services/api/homes_api_service.dart';

import '../../services/api/firebase_api_service.dart';

abstract class ServiceProviderProtocol {
  FirebaseAPIService firebaseAPIService();
  HomesAPIService homesAPIService();
}
