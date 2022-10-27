// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:musicapp/models/music_model.dart';
// import 'package:musicapp/services/music_service.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Results>? data;
//   Future getData() async {
//     var songs = await MusicService().getData();
//     setState(() {
//       data = songs;
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         child: ListView.builder(
//             itemCount: data?.length ?? 0,
//             itemBuilder: (BuildContext context, index) {
//               return Container(
//                   child: ListTile(
//                 title: Text(data?[index].artistName.toString() ?? ""),
//               ));
//             }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomerPage extends StatefulWidget {
  const HomerPage({Key? key}) : super(key: key);

  @override
  State<HomerPage> createState() => _HomerPageState();
}

class _HomerPageState extends State<HomerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomLeft,
                begin: Alignment.topRight,
                colors: [Colors.purple, Colors.white])),
        child: Scaffold(
            appBar: const _CustomAppBar(),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome'),
                      Text('Enjoy your favourite music'),
                      TextFormField(
                        autofocus: true,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: "Search",
                            prefixIcon:
                                Icon(Icons.search, color: Color(0xff202C7B)),
                            suffixIcon:
                                Icon(Icons.tune, color: Color(0xff202C7B))),
                      ),
                    ]),
              ),
            )));
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
          margin: EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
        )
      ],
    );
  }

  @override
  Size get PreferredSize => const Size.fromHeight(50.0);
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
