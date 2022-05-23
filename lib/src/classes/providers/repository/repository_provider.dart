import 'package:casapp/src/classes/providers/service/service_provider.dart';
import '../../repositories/homes/homes_repository.dart';

class RepositoryProvider {
  late final ServiceProvider _serviceProvider;

  RepositoryProvider(this._serviceProvider);

  HomesRepository homesRepository() {
    return HomesRepository(_serviceProvider.homesAPIService());
  }
}
