import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_receipt_app/models/unit_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UnitModel> units = [];

  void _getUnits() {
    units = UnitModel.getUnits();
  }

  @override
  Widget build(BuildContext context) {
    // Start up functions
    _getUnits(); // load user's owned apartment units

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32,
          ), // Divider
          Column(
            // Your Unit
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Your Units',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                height: 600,
                color: Colors.grey,
                child: ListView.builder(
                    itemCount: units.length,
                    itemBuilder: (context, index) {
                      return Container(
                        //TODO: Style container (axis?) of units properly
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(8),
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Colors.blueGrey),
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  color: Colors.green),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(units[index].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
