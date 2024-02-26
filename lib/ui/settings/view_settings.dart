// ignore_for_file: library_private_types_in_public_api

import 'package:dog/services/platform.dart';
import 'package:dog/widgets/widget.text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:io' show Platform;

class ViewSettings extends StatefulWidget {
  const ViewSettings({super.key});

  @override
  _ViewSettingsState createState() => _ViewSettingsState();
}

class _ViewSettingsState extends State<ViewSettings> {
  String androidVersion = '';
  String iOSVersion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 20, left: 10, top: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 32.0,
                    ),
                    SizedBox(width: 10.0),
                    TextBasic(
                      text: 'Help',
                      fontSize: 16.0,
                      color: Colors.black,
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.arrow_up_right,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Divider(
              thickness: 2,
              color: HexColor('#E5E5EA'),
              indent: 16,
            ),
            const SizedBox(height: 5.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 32.0,
                    ),
                    SizedBox(width: 10.0),
                    TextBasic(
                      text: 'Rate Us',
                      fontSize: 16.0,
                      color: Colors.black,
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.arrow_up_right,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Divider(
              thickness: 2,
              color: HexColor('#E5E5EA'),
              indent: 16,
            ),
            const SizedBox(height: 5.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.ios_share_outlined,
                      size: 32.0,
                    ),
                    SizedBox(width: 10.0),
                    TextBasic(
                      text: 'Share with Friends',
                      fontSize: 16.0,
                      color: Colors.black,
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.arrow_up_right,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Divider(
              thickness: 2,
              color: HexColor('#E5E5EA'),
              indent: 16,
            ),
            const SizedBox(height: 5.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      Icons.rule,
                      size: 32.0,
                    ),
                    SizedBox(width: 10.0),
                    TextBasic(
                      text: 'Terms of Use',
                      fontSize: 16.0,
                      color: Colors.black,
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.arrow_up_right,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Divider(
              thickness: 2,
              color: HexColor('#E5E5EA'),
              indent: 16,
            ),
            const SizedBox(height: 5.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.lock_shield,
                      size: 32.0,
                    ),
                    SizedBox(width: 10.0),
                    TextBasic(
                      text: 'Privacy Policy',
                      fontSize: 16.0,
                      color: Colors.black,
                    )
                  ],
                ),
                Icon(
                  CupertinoIcons.arrow_up_right,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Divider(
              thickness: 2,
              color: HexColor('#E5E5EA'),
              indent: 16,
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Row(
                  children: [
                    Icon(
                      CupertinoIcons.arrow_branch,
                      size: 32.0,
                    ),
                    SizedBox(width: 10.0),
                    TextBasic(
                      text: 'OS Version',
                      fontSize: 16.0,
                      color: Colors.black,
                    )
                  ],
                ),
                FutureBuilder(
                  future: _getPlatformVersions(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      if (snapshot.hasError) {
                        return TextBasic(
                          text: 'Error: ${snapshot.error}',
                          color: Colors.red, 
                          fontSize: 16.0,
                        );
                      } else {
                        return TextBasic(
                          text: snapshot.data.toString(),
                          color: Colors.black,
                          fontSize: 16.0,
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> _getPlatformVersions() async {
  var platform = Platform.isAndroid ? await PlatformVersion.androidVersion : await PlatformVersion.iOSVersion;
  return platform;
}
