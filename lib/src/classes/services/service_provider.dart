import 'package:casapp/src/classes/services/firebase/auth_service.dart';
import 'package:casapp/src/classes/services/protocols/auth_service_protocol.dart';
import 'package:casapp/src/classes/services/service_provider_protocol.dart';

class ServiceProvider implements ServiceProviderProtocol {
  AuthServiceProtocol authService() {
    return AuthService();
  }
}
