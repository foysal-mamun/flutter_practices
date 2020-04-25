import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  static const String routeName = '/misc/animated_list';
  static const String demoName = 'Animated List';

  _AnimatedListDemoState createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {

  final listData = initialListData;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AnimatedListDemo.demoName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: addUser
          )
        ],
      ),
      body: SafeArea(
        child: AnimatedList(
          key: _listKey,
          initialItemCount: initialListData.length,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: _buildItem(listData[index], index),
            );
          }
        )
      ),
    );
  }

  void addUser() {
    setState(() {
      int index = listData.length;
      listData.add(
        UserModel(firstName: "New $index", lastName: "Person")
      );

      _listKey.currentState.insertItem(index, duration: Duration(milliseconds: 300));
    });
  }

  Widget _buildItem(UserModel user, [int index]) {
    return ListTile(
      key: ValueKey<UserModel>(user),
      title: Text(user.firstName),
      subtitle: Text(user.lastName),
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      onLongPress: () => deleteUser(index),
    );
  }

  void deleteUser(int index) {
    setState(() {
      var user = listData.removeAt(index);
      _listKey.currentState.removeItem(
        index, 
        (context, animation) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Interval(0.5, 1.0)),
            child: SizeTransition(
              sizeFactor: CurvedAnimation(parent: animation, curve: Interval(0.0, 0.1)),
              axisAlignment: 0.0,
              child: _buildItem(user),
            ),
          );
        },
        duration: Duration(milliseconds: 600),
      );
    });
  }
  
}

class UserModel {
  final String firstName;
  final String lastName;

  const UserModel({ this.firstName, this.lastName });
}

List<UserModel> initialListData = [
  UserModel(
    firstName: "Govind",
    lastName: "Dixit",
  ),
  UserModel(
    firstName: "Greta",
    lastName: "Stoll",
  ),
  UserModel(
    firstName: "Monty",
    lastName: "Carlo",
  ),
  UserModel(
    firstName: "Petey",
    lastName: "Cruiser",
  ),
  UserModel(
    firstName: "Barry",
    lastName: "Cade",
  ),
];