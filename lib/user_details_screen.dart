import 'package:flutter/material.dart';
import 'user.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${user.name}\'s details")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("id: ${user.id}"),
              Text("name: ${user.name}"),
              Text("age: ${user.age}")
            ],
          ),
        ),
      ),
    );
  }
}
