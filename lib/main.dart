import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user.dart';
import 'user_list_tile.dart';
import 'user_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Users'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>> _getUsers() async {
    final response = await http.get("https://kiloloco.com/api/users");
    final usersResponse = json.decode(response.body);

    List<User> users = [];

    // for (var i = 0; i < usersResponse.length; i++) {
    //   final user = User.fromJson(usersResponse[i]);
    //   users.add(user);
    //   print(user.name);
    // }

    for (var user in usersResponse) {
      final aUser = User.fromJson(user);
      users.add(aUser);
      print(aUser.name);
    }

    return users;
  }

  @override
  void initState() {
    super.initState();
    this._getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: FutureBuilder(
        future: _getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                User user = snapshot.data[index];
                // return userRow.createUserList(snapshot.data[index]);
                return CreateUserList(
                    user: user,
                    action: () {
                      print("Go to next screen for ${user.name}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserDetailsScreen(user: user,)));
                    });
              },
            );
          } else {
            return Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("fetching users..",
                            style: TextStyle(color: Colors.deepPurple)))
                  ],
                ),
              ),
            );
          }
        },
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
