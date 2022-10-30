
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen.dart';

class MyDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal,
      child: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 30)),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 10)),
            ],
          ),
          SizedBox(height: 40),
          ListTile(
              onTap: () {},
              leading: Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: Text("Search", style: TextStyle(color: Colors.white))),
          ListTile(
              onTap: () {},
              leading: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              title: Text("Favourites", style: TextStyle(color: Colors.white))),
          ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text("Settings", style: TextStyle(color: Colors.white))),
          ListTile(
              onTap: () {},
              leading: Icon(
                Icons.help,
                color: Colors.white,
              ),
              title: Text("Help", style: TextStyle(color: Colors.white)))
          ,Divider(
            color: Colors.white,
            thickness: 1,
          ),
          ListTile(
              onTap: ()async {
                SharedPreferences preferences= await SharedPreferences.getInstance();
                preferences.remove("email");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => LoginScreen()));

              },
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ),
              title: Text("Logout", style: TextStyle(color: Colors.white))) ],
      ),

    );
  }
}
