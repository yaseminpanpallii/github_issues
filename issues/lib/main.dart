import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_issues/view/user_issues.dart';
import 'package:github_issues/view_model/appbar_view_model.dart'; 
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [ 
      ChangeNotifierProvider<AppbarViewModel>(create: (context) => AppbarViewModel())
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Github İssues',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const UserIssues(),
      ),
    );
  }
}
