import 'package:flutter/material.dart';

import 'package:presenter/screens/memberlist.dart';
import 'package:presenter/widgets/teamintro_bottom.dart';
import 'package:presenter/configs/palette.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Palette.primaryColor,
          toolbarHeight: 180.0,
          centerTitle: false,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30.0),
              Text(
                "내일배움캠프",
                style: TextStyle(
                  color: Palette.spartaColor,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "해냈조",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            labelPadding: EdgeInsets.all(16.0),
            indicatorPadding: EdgeInsets.all(16.0),
            labelColor: Palette.tertiaryColor,
            unselectedLabelColor: Palette.secondaryColor,
            indicatorColor: Palette.onPrimaryColor,
            indicator: BoxDecoration(
              color: Palette.onPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(26.0),
              ),
            ),
            tabs: [
              Tab(
                child: Text(
                  "TEAM",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "MEMBER",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            TeamIntroWidget(),
            MemberList(),
          ],
        ),
      ),
    );
  }
}
