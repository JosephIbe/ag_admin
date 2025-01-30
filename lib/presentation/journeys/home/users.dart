import 'package:flutter/material.dart';

import 'package:agoris_admin/common/size_constants.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: const Center(
          child: Text('Users', style: TextStyle(color: Colors.white, fontSize: Sizes.dimen_40),),
        ),
      ),
    );
  }

}