import 'package:casapp/src/classes/services/protocols/homes_service_protocol.dart';

import '../../../models/home_model.dart';
import '../routing/post_new_ad_routing.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'post_new_ad_state.dart';
part 'post_new_ad_event.dart';

class PostNewAdBloc extends Bloc<PostNewAdEvent, PostNewAdState> {
  final PostNewAdRouting postNewAdRouting;
  final HomesServiceProtocol homesAPIService;

  PostNewAdBloc(this.postNewAdRouting, this.homesAPIService) : super(const PostNewAdState());

  @override
  Stream<PostNewAdState> mapEventToState(PostNewAdEvent event) async* {
    if (event is PublishNewHomeEvent) {
      publishAd(event.homeModel);
    }
  }

  Future<void> publishAd(HomeModel homeModel) async {
    await homesAPIService.updateData(homeModel);
  }
}
