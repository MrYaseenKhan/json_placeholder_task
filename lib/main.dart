import 'package:flutter/material.dart';
import 'package:interview_task/providers/api_services_provider.dart';
import 'package:interview_task/screens/user_comments_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApiServicesProvider>(
      create: (context) => ApiServicesProvider(),
      child: MaterialApp(
        title: 'Interview Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserCommentsScreen(),
      ),
    );
  }
}
