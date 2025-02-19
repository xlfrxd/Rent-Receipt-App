import 'package:flutter/material.dart';

class UnitModel {
  String name;
  String address;

  //TODO: Add these parameters
  // String unit?;
//  Image image;

  UnitModel({
    required this.name,
    required this.address,
    
    
    //required this.image
  });

  static List<UnitModel> getUnits(){
    List<UnitModel> units = [];

    // SAMPLE DATA

    units.add(
      UnitModel(name: 'Kai Residences Unit 1621', address: 'Barangka Something, Mandaluyong', )
    );

    units.add(
      UnitModel(name: 'Lightmall Residences Unit 5011', address: 'Barangka Ilaya')
    );

    return units; 
  }
}