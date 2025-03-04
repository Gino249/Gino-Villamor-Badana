import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 25.0, bottom: 25),
  child: Container(
    padding: EdgeInsets.all(10),
  width:200,
  decoration: BoxDecoration(  color: Colors.black54, borderRadius: BorderRadius.circular(12)),
    child: 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Center(
  child: ClipRRect(borderRadius: BorderRadius.circular(12),
  child: Image.network("https://images.unsplash.com/photo-1509042239860-f550ce710b93?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", height: 160,),
  ),
),

Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Latte', style: TextStyle(fontSize: 20),),
      SizedBox(height: 4,),
      Text('With Almond Milk', style: TextStyle(color: Colors.grey[700]),)

    ],
  ),
),

Padding(
  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
  
      Text('\$400'),
      Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(4)),
        child: Icon(Icons.add)),
    ],
  ),
)
      ],
    )
    
    ),
    );
  }
}