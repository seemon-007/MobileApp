import 'package:flutter/material.dart';

class BasePageadmin extends StatefulWidget {
  final Widget body;
  final int index;

  const BasePageadmin({super.key, required this.body, required this.index});

  @override
  State createState(){
    return BasePageadminState();
  }
}

class BasePageadminState extends State<BasePageadmin>{

  final List<String> routes = ['/', '/report',];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: widget.index,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.business_center),
            label: 'Product',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long),
            label: 'report',
            backgroundColor: Colors.blue,
          ),

        ],
        onTap: (index) =>
            setState((){
              Navigator.pushNamed(context, routes[index]);
            }),
      ),
    );
  }
}