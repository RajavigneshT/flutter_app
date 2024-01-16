import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kindercruiser App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.cyanAccent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Admin Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle Inbox click
              },
            ),
            ListTile(
  leading: Icon(Icons.dashboard), // Use Icons.dashboard for a dashboard icon
  title: Text('Dashboard'),
  onTap: () {
    // Handle Dashboard click
    Navigator.pop(context); // Close the drawer
    // Navigate to the dashboard screen
    // You need to replace 'DashboardScreen()' with the actual screen you want to navigate to
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(),
      ),
    );
  },
),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Inbox click
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Reports'),
              onTap: () {
                // Handle Sent click
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Handle Inbox click
              },
            ),
            // Add more menu items as needed
          ],
        ),
      ),
      body: Center(
         child: Container(
            //color: Colors.blue, // Set the background color for the container
            padding: EdgeInsets.all(16.0),
        child: Text(
          'Welcome to Kindercruiser',
          style: TextStyle(fontSize: 30),
          
        ),
      ),
      ),
    );
  }
}
