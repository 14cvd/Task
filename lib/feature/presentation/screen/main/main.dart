import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../edited/edited.dart';
import 'provider/user_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.users.isEmpty) {
            return const Center(
              child: Text('No users available'),
            );
          }
          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final user = userProvider.users[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditedScreen(
                                title: user.title,
                                body: user.body,
                                index: index,
                                userProvider: userProvider,
                              )));
                },
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(index.toString()),
                    ),
                    title: Text(user.title ?? ''),
                    subtitle: Text(user.body ?? ''),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
