import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent Receipt App'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              color: Colors.blueGrey,
                onPressed: () {
                  setState(() {
                    //TODO: Implement reminders for bill due dates of tenants 
                  });
                },
                icon: Icon(CupertinoIcons.bell_fill)),
          ),
              
        ],
      ),
    );
  }
}
