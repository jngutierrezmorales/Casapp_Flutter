part of 'post_new_ad_bloc.dart';

class PostNewAdEvent {
  const PostNewAdEvent();
}

class PublishNewHomeEvent extends PostNewAdEvent {
  HomeModel homeModel;

  PublishNewHomeEvent(this.homeModel);
}

class PublishAdEvent extends PostNewAdEvent {
  final BuildContext context;
  HomeModel homeModel;

  PublishAdEvent({
    required this.context,
    required this.homeModel,
  });
}
