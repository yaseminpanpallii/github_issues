import 'package:flutter/material.dart';
import 'package:github_issues/constants/constants_values.dart';
import 'package:github_issues/model/issues_model.dart';
import 'package:github_issues/view_model/appbar_view_model.dart';
import 'package:provider/provider.dart';

class IssuesDetail extends StatefulWidget {
  IssuesDetail({Key? key, required this.model}) : super(key: key);
  UserIssuesModel model;
  @override
  State<IssuesDetail> createState() => _IssuesDetailState();
}

class _IssuesDetailState extends State<IssuesDetail> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _provideIslemleri();
  }

  Future<void> _provideIslemleri() async {
    final provider = Provider.of<AppbarViewModel>(context, listen: false);
    provider.baslangicIslemleri(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(left: kMediumMargin, top: kXLargeMargin),
      child: Consumer(
        builder: (context, value, widget_) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios)),
            const SizedBox(
              height: kXLargeMargin,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    widget.model.user.avatarUrl.toString(),
                    fit: BoxFit.fill,
                    height: screenHeight / 14,
                    width: screenWidth / 8,
                  ),
                ),
                SizedBox(
                  width: screenWidth / 15,
                ),
                SizedBox(
                  width: screenWidth / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.model.number.toString()),
                      SizedBox(
                        width: screenWidth / 1.7,
                        child: Text(widget.model.title.toString(), style: const TextStyle(decoration: TextDecoration.underline)),
                      ),
                    
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
