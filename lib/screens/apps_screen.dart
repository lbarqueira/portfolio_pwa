import 'package:flutter/material.dart';
import 'package:portfolio_pwa/services/url_launcher.dart';
import '../utils/constants.dart';

class AppsScreen extends StatelessWidget {
  final UrlLauncher urlLauncher = UrlLauncher();
  final String type;

  AppsScreen({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: LayoutBuilder(
          builder: (context, dimens) {
            if (dimens.maxWidth >= kDesktopBreakpoint) {
              return buildStackDesktop(context, Axis.horizontal, type);
            } else if (dimens.maxWidth >= kTabletBreakpoint) {
              return buildStackMobile(context, Axis.vertical, type);
            } else {
              return buildStackMobile(context, Axis.vertical, type);
            }
          },
        ),
      ),
    );
  }

  Stack buildStackMobile(BuildContext context, Axis direction, String type) {
    if (type == 'Apps') {
      return Stack(
        children: [
          Image(
            image: const AssetImage('assets/images/background_image.jpg'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Colors.black87.withOpacity(0.75),
            colorBlendMode: BlendMode.darken,
          ),
          ListView(
            scrollDirection: direction,
            children: [
              AppsListItem(
                // 300x300 png image
                image: const AssetImage('assets/images/lugh_happy.png'),
                onTap: () {
                  urlLauncher.launchInWebView(
                      'https://play.google.com/store/apps/details?id=com.barqueira.cicd.demo');
                },
                title: 'My great dog CI CD Flutter Demo',
                colorTitle: Color(0xBFDEC6AF),
              ),
            ],
          ),
        ],
      );
    } else if (type == 'Blogs') {
      return Stack(
        children: [
          Image(
            image: const AssetImage('assets/images/background_image.jpg'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Colors.black87.withOpacity(0.75),
            colorBlendMode: BlendMode.darken,
          ),
          ListView(
            scrollDirection: direction,
            children: [
              AppsListItem(
                // 300x300 png image
                image: const AssetImage('assets/images/blog_dev1.png'),
                onTap: () {
                  urlLauncher.launchInWebView(
                      'https://dev.to/lbarqueira/tips-for-publishing-a-flutter-app-on-google-play-store-275m');
                },
                title: 'Article published at Dev.to on the 15th Set 2020',
                colorTitle: Color(0xBF5F7D8C),
              ),
            ],
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          Image(
            image: const AssetImage('assets/images/background_image.jpg'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            color: Colors.black87.withOpacity(0.75),
            colorBlendMode: BlendMode.darken,
          ),
        ],
      );
    }
  }

  Stack buildStackDesktop(BuildContext context, Axis direction, String type) {
    Size size = MediaQuery.of(context).size;
    if (type == 'Apps') {
      return Stack(
        children: [
          Image(
            image: const AssetImage('assets/images/background_image.jpg'),
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
            color: Colors.black87.withOpacity(0.75),
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: size.height * 0.20),
            child: ListView(
              scrollDirection: direction,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: AppsListItem(
                    image: const AssetImage('assets/images/lugh_happy.png'),
                    onTap: () {
                      urlLauncher.launchInWebView(
                          'https://play.google.com/store/apps/details?id=com.barqueira.cicd.demo');
                    },
                    title: 'My great dog CI CD Flutter Demo',
                    colorTitle: Color(0xBFDEC6AF),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else if (type == 'Blogs') {
      return Stack(
        children: [
          Image(
            image: const AssetImage('assets/images/background_image.jpg'),
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
            color: Colors.black87.withOpacity(0.75),
            colorBlendMode: BlendMode.darken,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: size.height * 0.20),
            child: ListView(
              scrollDirection: direction,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: AppsListItem(
                    image: const AssetImage('assets/images/blog_dev1.png'),
                    onTap: () {
                      urlLauncher.launchInWebView(
                          'https://dev.to/lbarqueira/tips-for-publishing-a-flutter-app-on-google-play-store-275m');
                    },
                    title: 'Article published at Dev.to on the 15th Set 2020',
                    colorTitle: Color(0xBF5F7D8C),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          Image(
            image: const AssetImage('assets/images/background_image.jpg'),
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
            color: Colors.black87.withOpacity(0.75),
            colorBlendMode: BlendMode.darken,
          ),
        ],
      );
    }
  }
}

class AppsListItem extends StatelessWidget {
  final ImageProvider image;
  final Function onTap;
  final String title;
  final Color colorTitle;

  AppsListItem(
      {Key key,
      @required this.image,
      @required this.onTap,
      @required this.title,
      @required this.colorTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Card(
                margin: EdgeInsetsDirectional.only(top: 25, bottom: 0),
                child: Column(
                  children: [
                    Image(
                      //  width: MediaQuery.of(context).size.width / 2,
                      //  height: MediaQuery.of(context).size.height / 4,
                      width: 280.0,
                      height: 280.0,
                      fit: BoxFit.cover,
                      image: image,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            //height: MediaQuery.of(context).size.height / 14,
            //width: MediaQuery.of(context).size.width / 2,
            width: 280.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: colorTitle),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
