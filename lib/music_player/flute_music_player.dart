import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bean/music.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../page_index.dart';
import 'widgets/radial_seek_bar.dart';

class FluteMusicPlayerPage extends StatefulWidget {
  @override
  createState() => _FluteMusicPlayerPageState();
}

class _FluteMusicPlayerPageState extends State<FluteMusicPlayerPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double _thumbPercent = 0.0;

  /// 总时长
  Duration duration;
  Duration position;

  List<Music> _songs = [];

  MusicFinder audioPlayer;

  /// 当前音乐下标
  int _index = -1;
  int totalSongs = 0;

  PlayerState playerState = PlayerState.stopped;
  IconData _icon = Icons.play_arrow;

  /// 当前音乐名称
  String songTitle = '';

  get isPlaying => playerState == PlayerState.playing;

  get isPaused => playerState == PlayerState.paused;

  get durationText => Utils.duration2String(duration);

  get positionText => Utils.duration2String(position);

  @override
  void initState() {
    super.initState();
    audioPlayer = MusicFinder();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        /// 动画从 controller.forward() 正向执行 结束时会回调此方法
        print("status is completed");

        /// 重置起点
        _controller.reset();

        /// 开启
        _controller.forward();
      } else if (status == AnimationStatus.dismissed) {
        /// 动画从 controller.reverse() 反向执行 结束时会回调此方法
        print("status is dismissed");
      } else if (status == AnimationStatus.forward) {
        print("status is forward");

        /// 执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        /// 执行 controller.reverse() 会回调此状态
        print("status is reverse");
      }
    });

    initPlayer();
  }

  void initPlayer() async {
    try {
//      List<Song> songs = await MusicFinder.allSongs();
//
//      songs = List.from(songs);
//
//      if (songs.length > 0) {
//        debugPrint('${songs.toString()}=======${songs[0].uri}==');
//        songs.forEach((item) {
//          _songs.add(Music(
//              title: item.title,
//              audioPath: item.uri,
//              albumArtUrl: item.albumArt,
//              artists: item.artist));
//        });
//      } else {
      _songs = songsData;
//      }

      setState(() {
        totalSongs = _songs.length;
        _index = 0;
        songTitle = _songs[_index].title;
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    audioPlayer.setDurationHandler((d) => setState(() {
          duration = d;
          debugPrint('setDurationHandler========$duration');
        }));

    audioPlayer.setPositionHandler((p) => setState(() {
          position = p;
          debugPrint('setPositionHandler========$position');
          _thumbPercent = position != null && position.inMilliseconds > 0
              ? (position?.inMilliseconds?.toDouble() ?? 0.0) /
                  (duration?.inMilliseconds?.toDouble() ?? 0.0)
              : 0.0;
        }));

    audioPlayer.setCompletionHandler(() {
      _onComplete();
      setState(() {
        position = duration;

        debugPrint('setCompletionHandler========$position');
      });
    });

    audioPlayer.setErrorHandler((msg) {
      setState(() {
        playerState = PlayerState.stopped;
        duration = Duration(seconds: 0);
        position = Duration(seconds: 0);

        debugPrint('setErrorHandler========$position============$duration');
      });
    });
  }

  void _onComplete() {
    _controller.reset();
    debugPrint('onComplete========');
    setState(() {
      playerState = PlayerState.stopped;
      _icon = Icons.stop;
    });
  }

  Future _play({isLocal: true}) async {
    _controller.forward();

    final result =
        await audioPlayer.play(_songs[_index]?.audioPath, isLocal: isLocal);

    if (result == 1) {
      setState(() {
        playerState = PlayerState.playing;
        _icon = Icons.pause;
        songTitle = _songs[_index].title;
      });
    }
  }

  Future _pause() async {
    _controller.stop();

    final result = await audioPlayer.pause();
    if (result == 1)
      setState(() {
        playerState = PlayerState.paused;
        _icon = Icons.play_arrow;
        songTitle = _songs[_index].title;
      });
  }

  Future _stop() async {
    _controller.reset();

    final result = await audioPlayer.stop();
    if (result == 1)
      setState(() {
        playerState = PlayerState.stopped;
        _icon = Icons.stop;
      });
  }

  Future _seek(double seconds) async {
    await audioPlayer.seek((seconds / 1000).roundToDouble());
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer = null;

    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            brightness: Brightness.light,
            iconTheme: lightIconTheme,
            backgroundColor: Colors.transparent,
            title: Text(''),
            leading: IconButton(
                icon: Icon(SimpleLineIcons.arrow_left, size: 20),
                onPressed: () => Navigator.pop(context)),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                  icon: Icon(SimpleLineIcons.playlist, size: 20),
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (builder) => _bottomSheetItem(context)))
            ]),
        body: Column(children: <Widget>[
          // Seek bar
          Expanded(
              child: RadialSeekBarUI(
                  controller: _controller,
                  thumbPercent: _thumbPercent,
                  onDragEnd: (double percent) {
                    if (percent < 1.0) _play();
                  },
                  onDragUpdate: (double percent) {
                    setState(() {
                      _thumbPercent = percent;
                      if (isPlaying) _pause();

                      if (duration != null) {
                        position = Duration(
                            milliseconds:
                                (_thumbPercent * duration.inMilliseconds)
                                    .round());
                        _seek(_thumbPercent * duration.inMilliseconds);
                      }
                    });
                  })),

          // Lyric
          Container(height: 125.0, width: double.infinity),

          // Song title, artist name, and controls
          _buildBottomControls()
        ]));
  }

  Widget _buildBottomControls() {
    return Container(
        width: double.infinity,
        child: Material(
            color: accentColor,
            shadowColor: const Color(0x44000000),
            child: Padding(
                padding: EdgeInsets.only(top: 40, bottom: 50),
                child: Column(children: <Widget>[
                  RichText(
                      text: TextSpan(text: '', children: [
                    TextSpan(
                        text: '$songTitle\n',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                            height: 1.5)),
                    TextSpan(
                        text: position != null
                            ? "${positionText ?? ''} / ${durationText ?? ''}"
                            : duration != null ? durationText : '',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            height: 1.5))
                  ])),
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(children: <Widget>[
                        Spacer(),
                        _buildPreviousButton(),
                        Spacer(),
                        _buildPlayPausedButton(),
                        Spacer(),
                        _buildNextButton(),
                        Spacer()
                      ]))
                ]))));
  }

  Widget _buildNextButton() {
    return IconButton(
        splashColor: lightAccentColor,
        highlightColor: Colors.transparent,
        icon: Icon(Icons.skip_next, color: Colors.white, size: 35),
        onPressed: (_index + 1) >= totalSongs
            ? null
            : () {
                if (isPlaying || isPaused) _stop();
                _index++;
                _play();
              });
  }

  Widget _buildPreviousButton() {
    return IconButton(
        splashColor: lightAccentColor,
        highlightColor: Colors.transparent,
        icon: Icon(Icons.skip_previous, color: Colors.white, size: 35),
        onPressed: _index <= 0
            ? null
            : () {
                if (isPlaying || isPaused) _stop();
                _index--;
                _play();
              });
  }

  Widget _buildPlayPausedButton() {
    return CircleButton(
      onPressedAction: () {
        if (isPlaying) {
          _pause();
        } else {
          _play();
        }
      },
      fillColor: Colors.white,
      splashColor: lightAccentColor,
      highlightColor: lightAccentColor.withOpacity(0.5),
      elevation: 10.0,
      highlightElevation: 5,
      icon: _icon,
      iconSize: 35,
      size: 50,
      iconColor: darkAccentColor,
    );
  }

  Widget _bottomSheetItem(BuildContext context) {
    return ListView(
        // 生成一个列表选择器
        children: _songs.map((song) {
      int index = _songs.indexOf(song);
      return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('${song?.title[0]}'),
          ),
          title: Text('${song?.title}'),
          onTap: () {
            if (isPlaying || isPaused) {
              if (_index != index)
                setState(() {
                  _stop().then((_) {
                    _index = index;
                    _play();
                  });
                });
            } else {
              _index = index;
              _play();
            }
            Navigator.pop(context);
          },
          selected: _index == index);
    }).toList());
  }
}
