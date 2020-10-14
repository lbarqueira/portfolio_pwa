import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio_pwa/services/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'apps_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UrlLauncher urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Theme(
          data: Theme.of(context).copyWith(
            // Set the transparency here
            canvasColor: Colors
                .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
          ),
          child: AppDrawer(),
        ),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Image(
              image: const AssetImage('assets/images/portfolio_image.jpg'),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              color: Colors.black87.withOpacity(0.75),
              colorBlendMode: BlendMode.darken,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 80, 150, 0),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypewriterAnimatedTextKit(
                    text: ['Hello, I`m Luis Barqueira'],
                    textStyle: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white54),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nice meeting you!',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20),
                  socialAccounts(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.45),
                  Text('Share it!',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.left,),
                  SizedBox(
                    width: 70.0,
                    height: 2.0,
                    child: Container(color: Colors.white,),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: InkWell(
                          onTap: () async {
                            await urlLauncher.mailUsers(
                                'mailto:?subject=LuisBarqueira&body=https://lbarqueira.github.io/');
                          },
                          child: Icon(
                            AntDesign.mail,
                            color: Colors.white70,
                            size: 25.0,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          qrDialog(context);
                        },
                        child: Icon(
                          AntDesign.qrcode,
                          color: Colors.white70,
                          size: 25.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget socialAccounts() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () async {
              await urlLauncher.mailUsers(
                  'mailto:luis.barqueira@gmail.com?subject=YourSubject&body=Hello');
            },
            child: Icon(
              AntDesign.mail,
              color: Colors.white70,
              size: 25.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              urlLauncher.launchInBrowser('https://twitter.com/barqueira');
            },
            child: Icon(
              AntDesign.twitter,
              color: Colors.white70,
              size: 25.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              urlLauncher.launchInBrowser(
                  'https://www.linkedin.com/in/luis-barqueira-7369092/');
            },
            child: Icon(
              AntDesign.linkedin_square,
              color: Colors.white70,
              size: 25.0,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            urlLauncher.launchInBrowser('https://github.com/lbarqueira');
          },
          child: Icon(
            AntDesign.github,
            color: Colors.white70,
            size: 25.0,
          ),
        )
      ],
    );
  }
}

Future<bool> qrDialog(context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Container(
          height: 370.0,
          width: 370.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
          child: Column(
            children: <Widget>[
              Image(
                image: const AssetImage('assets/images/qr_code.png'),
                width: 300.0,
                height: 300.0,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                  child: Center(
                    child: Text(
                      'Done',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.transparent)
            ],
          ),
        ),
      );
    },
  );
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //           _buildDrawerHeader(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            _AppDrawerTile(
              title: 'Blogs',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppsScreen(),
                  ),
                );
              },
            ),
            _AppDrawerTile(
              title: 'Apps',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppsScreen(),
                  ),
                );
              },
            ),
            _AppDrawerTile(
              title: 'Projects',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AppsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  DrawerHeader _buildDrawerHeader(context) {
    return DrawerHeader(
      child: Text(
        'Blogs & Apps & Projects',
        style: TextStyle(
            color: Colors.white70,
            fontSize: MediaQuery.of(context).size.width * 0.04),
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.black87.withOpacity(0.70), BlendMode.darken),
          fit: BoxFit.cover,
          image: AssetImage('assets/images/portfolio_image.jpg'),
        ),
      ),
    );
  }
}

class _AppDrawerTile extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppDrawerTile({Key key, @required this.title, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        side: BorderSide(width: 2, color: Colors.black54.withOpacity(0.75)),
      ),

      color: Color(0xBF403A38), // 85% — D9, 80% — CC, 75% — BF
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: Colors.white54,
              fontSize: 20.0),
        ),
        onTap: onTap,
      ),
    );
  }
}
