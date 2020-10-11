import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:portfolio_pwa/services/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        color: Colors.white54),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Nice meeting you!',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30),
                  socialAccounts(),
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

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(context),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
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
