import 'package:flutter/material.dart';
import 'package:portfolio_pwa/services/url_launcher.dart';

class AppsScreen extends StatelessWidget {
  final UrlLauncher urlLauncher = UrlLauncher();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
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
              children: [
                AppsListItem(
                  image: const AssetImage('assets/images/lugh_happy.png'),
                  onTap: () {
                    urlLauncher.launchInWebView(
                        'https://play.google.com/store/apps/details?id=com.barqueira.cicd.demo');
                  },
                  title: 'My great dog CI CD Flutter Demo',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppsListItem extends StatelessWidget {
  final ImageProvider image;
  final Function onTap;
  final String title;
  AppsListItem({
    Key key,
    @required this.image,
    @required this.onTap,
    @required this.title,
  }) : super(key: key);

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
                margin: EdgeInsetsDirectional.only(top: 20, bottom: 0),
                child: Column(
                  children: [
                    Image(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 4,
                      fit: BoxFit.cover,
                      image: image,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width / 2,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Color(0xBFDEC6AF)),
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
