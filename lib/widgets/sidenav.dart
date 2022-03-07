// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://images.pexels.com/photos/2167673/pexels-photo-2167673.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'data:image/jpeg;base64,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'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Friends'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
            onTap: () => null,
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}



// Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         jeminaBlue,
//                         // lightBackground.withOpacity(0.7),
//                         techBlue
//                       ],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                   ),
//                 ),
//                 SafeArea(
//                   child: Container(
//                     width: 200.0,
//                     padding: EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         DrawerHeader(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CircleAvatar(
//                                 radius: 50.0,
//                                 backgroundImage: NetworkImage(
//                                   "https://images.pexels.com/photos/2167673/pexels-photo-2167673.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
//                                 ),
//                               ),
//                               SizedBox(height: 10.0),
//                               Text(
//                                 "Eren Yeager!",
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 20.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: ListView(
//                             children: [
//                               ListTile(
//                                 onTap: () {},
//                                 leading: Icon(
//                                   Icons.home,
//                                   color: Colors.white,
//                                 ),
//                                 title: Text(
//                                   "Home",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                               ListTile(
//                                 onTap: () {},
//                                 leading: Icon(
//                                   Icons.settings,
//                                   color: Colors.white,
//                                 ),
//                                 title: Text(
//                                   "Settings",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                               ListTile(
//                                 onTap: () {},
//                                 leading: Icon(
//                                   Icons.logout,
//                                   color: Colors.white,
//                                 ),
//                                 title: Text(
//                                   "Logout",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),