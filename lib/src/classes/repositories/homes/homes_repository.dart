import '../../services/protocols/homes_service_protocol.dart';

class HomesRepository {
  late final HomesServiceProtocol _homesService;

  HomesRepository(HomesServiceProtocol homesService) : _homesService = homesService;

  Future<List> getHomes() async {
    final getData = await _homesService.getHomes();
    return getData;
  }
}
