import 'package:flutter/material.dart';

class TabletUi extends StatelessWidget {
  const TabletUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Text("OSTAD"),
      ),
      actions: [
        // I can't catch the words it is so blurry
        // That's why I put the random Text Button
        TextButton(onPressed: () {}, child: Text("Explore")),
        TextButton(onPressed: () {}, child: Text("About")),
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

            SizedBox(height: 32,),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
            FilledButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
                  backgroundColor: WidgetStatePropertyAll(Colors.teal)),
              onPressed: () {},
              // This is not actual text as your given UI
              // I can not get the text, it is so blurry
              child: Text("Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
