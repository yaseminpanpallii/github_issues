import 'package:flutter/cupertino.dart';
import 'package:github_issues/model/issues_model.dart';
import 'package:github_issues/service/issues_service.dart';

class AppbarViewModel extends ChangeNotifier {
  TextEditingController tec = TextEditingController();

  List<UserIssuesModel> searchList = [];

  bool isLoadPage = false;
  CompanyUsersService objectService = CompanyUsersService();
  List<UserIssuesModel> issuesModel = [];
  List<UserIssuesModel> issuesModelYedek = [];
  void baslangicIslemleri(BuildContext context) {
    getIssues(context);
  }

  Future<void> getIssues(BuildContext context) async {
    issuesModelYedek = await objectService.getUserService(context);
    issuesModel = List.from(issuesModelYedek);
    isLoadPage = true;
    notifyListeners();
  }

  void aramaYap({required String aramaMetni}) {
    issuesModel.clear();
    for (var i = 0; i < issuesModelYedek.length; i++) {
      if (issuesModelYedek[i].title.toLowerCase().contains(aramaMetni.toLowerCase())) {
        issuesModel.add(issuesModelYedek[i]);
      }  
    }
    /* if (aramaMetni.trim().isEmpty) {
      searchList = List.of(search);
    } else {
      searchList = search.where((element) => element.title.toLowerCase().contains(aramaMetni.toLowerCase())).toList();
    } */
    notifyListeners();
  }
}
