import 'package:flutter/material.dart';
import 'package:github_issues/constants/constants_values.dart';
import 'package:github_issues/constants/custom_appbar.dart';
import 'package:github_issues/view/issues_detail.dart';
import 'package:github_issues/view_model/appbar_view_model.dart';
import 'package:provider/provider.dart';

class UserIssues extends StatefulWidget {
  const UserIssues({Key? key}) : super(key: key);

  @override
  State<UserIssues> createState() => _UserIssuesState();
}

class _UserIssuesState extends State<UserIssues> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      appBar: PreferredSize(preferredSize: Size(screenWidth, screenHeight), child: const CustomAppbar()),
      body: Consumer<AppbarViewModel>(
          builder: (context, value, widget_) => value.isLoadPage
              ? SingleChildScrollView(
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.issuesModel.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => IssuesDetail(model: value.issuesModel[index],)));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: kLargeMargin, top: kMediumMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    value.issuesModel[index].user.avatarUrl,
                                    fit: BoxFit.fill,
                                    height: screenHeight / 14,
                                    width: screenWidth / 8,
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth / 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(value.issuesModel[index].number.toString() ),
                                    SizedBox(
                                      width: screenWidth / 1.7,
                                      child: Text(
                                        value.issuesModel[index].title.toString(),
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                         style: TextStyle(
                    decoration: TextDecoration.underline)
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : const Center(child: CircularProgressIndicator())),
    );
  }
}
