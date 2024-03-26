import 'package:flutter/material.dart';
import 'package:interview_task/providers/api_services_provider.dart';
import 'package:interview_task/models/user_comments_model.dart';
import 'package:provider/provider.dart';

class UserCommentsScreen extends StatelessWidget {
  const UserCommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiServicesProvider apiServicesProvider =
        context.read<ApiServicesProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<UserComments>>(
        future: apiServicesProvider.fetchUserComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  List<UserComments>? commentsModel = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: Text('${commentsModel?[index].id}'),
                      title: Text('${commentsModel?[index].name}'),
                      subtitle: Text('${commentsModel?[index].body}'),
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          }
        },
      ),
    );
  }
}
