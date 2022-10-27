import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musicapp/models/music_model.dart';
import 'package:musicapp/ui/album_details.dart';

class AlbumDetail extends StatefulWidget {
  AlbumDetail({Key? key, required this.model}) : super(key: key);
  Results model;
  @override
  State<AlbumDetail> createState() => _AlbumDetailState();
}

class _AlbumDetailState extends State<AlbumDetail> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Slider(
                    //   min: 0,
                    //   max: duration.inSeconds.toDouble(),
                    //   value: position.inSeconds.toDouble(),
                    //   onChanged: (value) async{},
                    // ),
                    Text(
                      "00.00",
                      style : TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Slider.adaptive(
                      value: 0,
                      onChanged: (value) {
                      },
                      activeColor: Colors.white,
                    ),

                    Text("${duration!.inMinutes}: ${duration!.inSeconds % 60}",
                    style: TextStyle(
                      color: Colors.white,
                    ),)
                  ],
                ),

                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    color: Colors.black87,
                    border: Border.all(color: Colors.pink),
                  ),
                  child: InkWell(
                    onTap : () {},
                    child: Icon(Icons.play_arrow,
                    color: Colors.white),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
