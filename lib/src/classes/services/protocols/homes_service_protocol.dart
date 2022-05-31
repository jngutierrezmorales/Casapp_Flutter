import '../../models/home_model.dart';

abstract class HomesServiceProtocol {
  Future<List<HomeModel>> getHomes();
  Future<void> updateData(HomeModel homeModel);
}
