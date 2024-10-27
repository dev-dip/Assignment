import 'package:flutter/material.dart';

class MobileUi extends StatelessWidget {
  const MobileUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        // I can't catch the words it is so blurry
        // That's why I put the random Text
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text("OSTAD"),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Text(
              "FLUTTER WEB.\nTHE BASICS",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 32,
            ),
            // Body
            // This is not actual text as your given UI
            // I can not get the text, it is so blurry
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                "Flutter is a free, open-source framework from Google that allows developers to build applications for multiple platforms using a single codebase. It's used to create the user interface (UI) for apps on mobile, web, desktop, and embedded devices.",
                maxLines: 10,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: FilledButton(
                style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                    backgroundColor: WidgetStatePropertyAll(Colors.teal)),
                onPressed: () {},
                // This is not actual text as your given UI
                // I can not get the text, it is so blurry
                child: Text("Get Started"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Center(
              child: Text(
                "OSTAD",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(Icons.explore),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Explore"),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(Icons.info),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("About"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
