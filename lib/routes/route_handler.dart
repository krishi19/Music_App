import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/models/music_model.dart';
import 'package:musicapp/routes/route_arguments.dart';
import 'package:musicapp/ui/album_details.dart';

import '../constants/route_strings.dart';
import '../ui/home_page.dart';
import '../ui/login_page.dart';

class RouteHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case RouteStrings.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteStrings.albumPage:
        var typedArgs = args as MusicArguments;
        return MaterialPageRoute(
            builder: (_) => AlbumDetail(model: typedArgs.musicModel));
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
