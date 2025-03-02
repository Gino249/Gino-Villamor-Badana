import 'package:flutter/material.dart'; // Importing the Flutter Material package
import 'package:untitled/widgets/pages/Profile.dart';
import 'package:untitled/widgets/pages/home.dart'; // Importing a custom Home widget from another file

void main() => runApp(
  MaterialApp(
    // Creating the root of the application
    debugShowCheckedModeBanner: false, // Disabling the debug banner
    theme: ThemeData(
      // Defining the theme of the app
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal, // Setting the primary color to teal
        brightness: Brightness.dark, // Setting the theme to dark mode
      ),
    ),
    home: Home(), // Setting the Home widget as the default page
  ),
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyWidget(); // Returning a custom stateful widget
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int currentIndex = 0; // State variable to keep track of the current index
  List<Widget> pages = [Home_view(), Profile_view()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar at the top of the screen
        title: Text('Flutter App'), // Title of the AppBar
        centerTitle: true, // Centering the title
        actions: [Icon(Icons.light_mode_outlined)], // Icon button on the AppBar
      ),
      body: currentIndex == 0 ? pages[0] : pages[1],
      bottomNavigationBar: NavigationBar(
        // Bottom navigation bar with two destinations
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value; // Updating the state with the selected index
          });
        },
        selectedIndex: currentIndex, // Highlighting the selected destination
      ),
      drawer: SafeArea(child: Drawer(child: ListTile(title: Text("data")))),
    ); // Conditional rendering of the body content
  }
}
