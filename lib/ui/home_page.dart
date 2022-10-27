import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/components/playlist.dart';
import 'package:musicapp/routes/route_arguments.dart';
import 'package:musicapp/services/music_service.dart';
import 'package:musicapp/ui/album_details.dart';

import '../constants/route_strings.dart';
import '../models/music_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomLeft,
                begin: Alignment.topRight,
                colors: [Colors.purple, Colors.white])),
        child: Scaffold(
            appBar: _CustomAppBar(),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.purple.shade200.withOpacity(0.8),
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: 'Favourites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_outline),
                  label: 'Play',
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
                child: SingleChildScrollView(
                    primary: false,
                    child: Column(children: [
                      Container(
                          height: 40,
                          width: 330,
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 15.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      border: InputBorder.none,
                                      hintText: "Search Songs",
                                      prefixIcon: Icon(Icons.search,
                                          color: Color(0xff202C7B)),
                                    ),
                                  ),
                                )
                              ])),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 236, 0),
                        child: Text(
                          'Songs for you',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 250.0,
                        child: ListView.builder(
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,

                          itemCount: data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: 190,
                              margin: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 10,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.favorite_border_outlined)),
                                  ),
                                  Positioned(
                                    top: 15,
                                    left: 64,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30,
                                      child: Image.network(data![index]
                                          .artworkUrl100
                                          .toString()),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 84),
                                    child: Column(children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    '${data![index].artistName}\n',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            TextSpan(
                                                text:
                                                    '${data![index].artistName}\n',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            TextSpan(
                                                text:
                                                    '${data![index].artistName}\n',
                                                style: TextStyle(
                                                    color: Color(0xff6A6A6A),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ]),
                                        ),
                                      ),

                                      SizedBox(
                                        width: 130,
                                        child: RaisedButton(
                                          color: Colors.blue,
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                RouteStrings.albumPage, arguments: MusicArguments(musicModel: data![index]));
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Text(
                                            'View Details',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                      //  ),
                                    ]),
                                  )
                                ],
                              ),
                            );
                          },
                          // separatorBuilder: (BuildContext context, int index) =>
                          //     const SizedBox(
                          //   width: 10,
                          // ),
                        ),
                      ),
                      const MyPlayList(),
                    ])))));
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
