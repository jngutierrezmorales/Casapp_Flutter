import '../../models/home_model.dart';
import '../../services/protocols/homes_service_protocol.dart';

class HomesRepository {
  late final HomesServiceProtocol _homesService;

  HomesRepository(HomesServiceProtocol homesService) : _homesService = homesService;

  Future<List<HomeModel>> getHomes() async {
    final getData = await _homesService.getHomes();
    return getData;
  }
}
