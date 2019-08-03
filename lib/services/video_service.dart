import 'package:flutter_video_likes_bloc/model/video_model.dart';

class VideoService {
  Map<String, dynamic> video = {
    "id": "ADasdFdsfasdFgdagdSasdf",
    "name": "Flutter Video",
    "likes": 0,
    "dislikes": 0
  };

  VideoModel getVideo(){
    VideoModel videoModel = VideoModel.fromJson(video);

    return videoModel;
  }
}
