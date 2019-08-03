import 'package:flutter/material.dart';
import 'package:flutter_video_likes_bloc/blocs/video_bloc.dart';
import 'package:flutter_video_likes_bloc/model/video_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoBloc _videoBloc;

  @override
  void initState() {
    _videoBloc = VideoBloc();
    super.initState();
  }

  @override
  void dispose() {
    _videoBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/background.jpg"))),
            ),
            Positioned(
              left: 35,
              top: 272,
              child: StreamBuilder<VideoModel>(
                stream: _videoBloc.outVideoStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  return GestureDetector(
                    onTap: () {
                      _videoBloc.outLikeVideoSink.add(snapshot.data);
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.thumb_up,
                          color: Colors.green,
                          size: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 302,
              left: 36,
              child: StreamBuilder<VideoModel>(
                stream: _videoBloc.outVideoStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Text(
                      "${snapshot.data.likes}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    );
                  return Container();
                },
              ),
            ),
            Positioned(
              left: 90,
              top: 272,
              child: StreamBuilder<VideoModel>(
                  stream: _videoBloc.outVideoStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    return GestureDetector(
                      onTap: () {
                        _videoBloc.outDislikeVideoSink.add(snapshot.data);
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.thumb_down,
                            color: Colors.red,
                            size: 20,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Positioned(
              top: 302,
              left: 97,
              child: StreamBuilder<VideoModel>(
                  stream: _videoBloc.outVideoStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return Text(
                        "${snapshot.data.dislikes}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      );
                    return Container();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
