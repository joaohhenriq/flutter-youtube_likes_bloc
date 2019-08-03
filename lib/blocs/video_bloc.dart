import 'package:flutter_video_likes_bloc/model/video_model.dart';
import 'package:flutter_video_likes_bloc/services/video_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class VideoBloc extends BlocBase {

  final _videoService = VideoService();
  VideoModel _videoModel = VideoModel();

  final _videoController = BehaviorSubject<VideoModel>();
  Stream<VideoModel> get outVideoStream => _videoController.stream;
  Sink<VideoModel> get outVideoSink => _videoController.sink;

  final _likeVideoController = BehaviorSubject<VideoModel>();
  Stream<VideoModel> get outLikeVideoStream => _likeVideoController.stream;
  Sink<VideoModel> get outLikeVideoSink => _likeVideoController.sink;

  final _dislikeVideoController = BehaviorSubject<VideoModel>();
  Stream<VideoModel> get outDislikeVideoStream => _dislikeVideoController.stream;
  Sink<VideoModel> get outDislikeVideoSink => _dislikeVideoController.sink;

  VideoBloc(){
    _videoModel = _videoService.getVideo();
    outVideoSink.add(_videoModel);

    outLikeVideoStream.listen(_like);
    outDislikeVideoStream.listen((value) => _dislike(value));
  }

  _like(VideoModel videoModel){
    _videoModel.likes++;
    outVideoSink.add(_videoModel);
  }

  _dislike(VideoModel videoModel){
    _videoModel.dislikes++;
    outVideoSink.add(_videoModel);
  }


  @override
  void dispose() {
    _videoController.close();
    _likeVideoController.close();
    _dislikeVideoController.close();
    super.dispose();
  }
}