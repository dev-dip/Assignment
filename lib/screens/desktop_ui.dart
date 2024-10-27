import 'package:flutter/material.dart';

class DesktopUi extends StatelessWidget {
  const DesktopUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
        child: Text("OSTAD"),
      ),
      actions: [
        // I can't catch the words it is so blurry
        // That's why I put the random Text Button
        TextButton(onPressed: () {}, child: Text("Explore")),
        Padding(
          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),

          child: TextButton(onPressed: () {}, child: Text("About")),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header
                Text(
                  "FLUTTER WEB.\nTHE BASICS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Body
                // This is not actual text as your given UI
                // I can not get the text, it is so blurry
                Text(
                  "Flutter is a free, open-source framework from Google that allows developers to build applications for multiple platforms using a single codebase. It's used to create the user interface (UI) for apps on mobile, web, desktop, and embedded devices.",
                  maxLines: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Center(
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
          ),
        ],
      ),
    );
  }
}
