import '../routing/post_new_ad_routing.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'post_new_ad_state.dart';
part 'post_new_ad_event.dart';

class PostNewAdBloc extends Bloc<PostNewAdEvent, PostNewAdState> {
  final PostNewAdRouting postNewAdRouting;

  PostNewAdBloc(this.postNewAdRouting) : super(const PostNewAdState());

  @override
  Stream<PostNewAdState> mapEventToState(PostNewAdEvent event) async* {

  }
}