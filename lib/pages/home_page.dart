import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_projects/pages/util/coffee_tile.dart';
import 'package:flutter_projects/pages/util/coffee_type.dart';
class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
final List coffeeType = [

  ['Cappucino', true,],
  ['Latte', false,],
  ['Black', false,],
];

  void coffeeTypeSelected(int index){
setState(() {
  coffeeType[index][1] = true;
});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(Icons.person),
        )],
       ),
       bottomNavigationBar: BottomNavigationBar(
        items: [
BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '')
],
        
        
        ),
body: Column(children: [

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25.0),
  child: Text("Find the best coffee for you", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
),

SizedBox(height: 25,),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25.0),
  child: TextField(
  
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.search),
    hintText: 'Find your coffee...',    
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade600, ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade600, ),
    ),
  ),
  
  ),
),

SizedBox(height: 25.0,),

Container(
  height: 50,
  child: ListView.builder( scrollDirection: Axis.horizontal, itemCount: coffeeType.length, itemBuilder: (context, index,) {

    return CoffeeType(coffeeType: coffeeType[index][0], isSelected: coffeeType[index][1], onTap: (){
      coffeeTypeSelected(index);
    });
  }),
),


Expanded(child: 
ListView(
  scrollDirection: Axis.horizontal,
children: [
CoffeeTile(),
],

)

)

],),

    );
  }
}
