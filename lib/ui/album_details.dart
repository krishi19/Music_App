import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musicapp/services/music_service.dart';

import '../models/music_model.dart';

class AlbumDetail extends StatefulWidget {
  AlbumDetail({Key? key, required this.model}) : super(key: key);
  Results model;
  

  @override
  State<AlbumDetail> createState() => _AlbumDetailState();
}

class _AlbumDetailState extends State<AlbumDetail> {
  List<Results>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //   _player = AudioPlayer();
    // cache = AudioCache(fixedPlayer: _player);
    getData();
  }

  Future getData() async {
    var datas = await MusicService().getData();
    setState(() {
      data = datas;
    });
  }

  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  late AudioPlayer _player;
  late AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Slider.adaptive(
        activeColor: Colors.blue[800],
        inactiveColor: Colors.grey[350],
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value.toInt());
        });
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.bottomLeft,
              begin: Alignment.topRight,
              colors: [Colors.purple, Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image(
                height: 280,
                fit: BoxFit.contain,
                width: double.infinity,
                image: NetworkImage(
                  widget.model.artworkUrl100.toString(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.model.artistName.toString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white54),
            ),
            SizedBox(height: 4),
            Text(
              widget.model.artistName.toString(),
              style: TextStyle(color: Colors.white54),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                slider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 45.0,
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_previous,
                        )),
                    IconButton(
                        iconSize: 62,
                        onPressed: () {
                          if (!playing) {
                            setState(() {
                              playBtn = Icons.pause;
                              playing = true;
                            });
                          } else {
                            setState(() {
                              playBtn = Icons.play_arrow;
                              playing = false;
                            });
                          }
                        },
                        icon: Icon(playBtn)),
                    IconButton(
                        iconSize: 45.0,
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_next,
                        ))
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class AudioCache {}

class AudioPlayer {
  void seek(Duration newPos) {}

  void dispose() {}
}
