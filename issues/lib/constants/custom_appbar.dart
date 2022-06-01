import 'package:flutter/material.dart';
import 'package:github_issues/view_model/appbar_view_model.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight / 4.5,
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            height: screenHeight / 6,
            child: const Center(
              child: Text(
                "ISSUES",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 7.4,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: DecoratedBox(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.0), border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.0), color: Colors.white),
                child: Row(
                  children: [
                    Expanded(
                      child: Consumer<AppbarViewModel>(
                        builder: (context, value, widget) => TextField(
                          controller: value.tec,
                          minLines: 1,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: " Search",
                          ),
                          onChanged: (_) {
                            if (value.tec.text.isEmpty) {
                              value.aramaYap(aramaMetni: value.tec.text);
                            }
                          },
                        ),
                      ),
                    ),
                    Consumer<AppbarViewModel>(
                      builder: (context, value, widget) => IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          value.aramaYap(aramaMetni: value.tec.text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
