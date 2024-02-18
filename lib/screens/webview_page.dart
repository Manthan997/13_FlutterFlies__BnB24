import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'webview.dart';
import 'constants.dart';

class HomePage2 extends StatelessWidget {
  final List<String> urls = [
    "https://tangible-invented-hellebore.glitch.me/",
    "https://juniper-mighty-pepper.glitch.me/",
    "https://gem-highfalutin-pruner.glitch.me/",
    "https://darkened-handsomely-cloudberry.glitch.me/",
    "https://bird-celestial-chair.glitch.me/",
    // Add more URLs as needed
  ];

  final List<String> buttonNames = [
    "Human Body",
    "skeleton",
    "Human eye",
    "human brain ",
    "Heart",
    // Add more names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [Text('AR ACADEMY')],
      appBar: AppBar(
        title: Text("A R V I E W ", style: kHeadingStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: urls.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.0),
          itemBuilder: (context, index) {
            return ElevatedButton(
              child: Text(buttonNames[index], style: kContainerTextStyle.copyWith(fontWeight: kBoldFontWeight)),
              onPressed: () => _launchURL(urls[index]),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.black),
                ),
                padding: EdgeInsets.all(16.0),
                primary: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}

_launchURL(String _url) async {
  if (await launchUrl(Uri.parse(_url))) {
    await launchUrl(Uri.parse(_url));
  } else {
    throw 'Could not launch $_url';
  }
}