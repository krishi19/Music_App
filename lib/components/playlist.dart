import 'package:flutter/material.dart';
import 'package:musicapp/models/music_model.dart';
import 'package:musicapp/services/music_service.dart';

class MyPlayList extends StatefulWidget {
  const MyPlayList({Key? key}) : super(key: key);

  @override
  State<MyPlayList> createState() => _MyPlayListState();
}

class _MyPlayListState extends State<MyPlayList> {
  List<Results>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future getData() async {
    var datas = await MusicService().getData();
    setState(() {
      data = datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Playlists',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'View more',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 260.0,
          child: ListView.builder(
            itemCount: data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Container(
                  height: 75,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade300.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(data![index].artworkUrl100.toString(),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                             ' ${data![index].artistName}'
                            ),
                            Text(
                             ' ${data![index].trackName}'
                            ),
                          ],
                        ),
                      ), 
                      IconButton(onPressed: () {}, 
                      icon: const Icon(
                        Icons.play_circle,
                        color: Colors.white
                      ))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
