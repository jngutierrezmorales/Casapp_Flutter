import '../../models/home_model.dart';
import '../../services/protocols/homes_service_protocol.dart';

class HomesRepository {
  late final HomesServiceProtocol _homesService;

  HomesRepository(HomesServiceProtocol homesService) : _homesService = homesService;

  List<HomeModel> getHomes() {
    final getData = _homesService.getHomes();
    return getData;
  }
}
