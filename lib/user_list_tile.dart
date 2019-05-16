import 'package:flutter/material.dart';
import 'user.dart';
import 'user_details_screen.dart';

class CreateUserList extends StatelessWidget {
  final User user;
  final Function action;

  const CreateUserList({Key key, this.user, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: ListTile(
        leading: Icon(Icons.perm_identity, color: Colors.purpleAccent),
        title: Text(user.name),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}

// Widget createUserList(User user) => ListTile(
//     leading: Icon(Icons.perm_identity, color: Colors.purpleAccent),
//     title: Text(user.name),
//     trailing: Icon(Icons.chevron_right),
//   );
