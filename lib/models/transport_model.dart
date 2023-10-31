// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';

class TransportModel {
  late String name;
  late String iconPath;
  late String cost;
  late String duration;
  late String mode;
  late Color boxColor;
  late bool viewIsSelected;
  TransportModel({
    required this.name,
    required this.iconPath,
    required this.cost,
    required this.duration,
    required this.mode,
    required this.boxColor,
    required this.viewIsSelected,
  });
  static List<TransportModel> getTransport() {
    List<TransportModel> transport = [];

    transport.add(TransportModel(
      name: 'Goa',
      iconPath: 'assets/icons/goa1.png',
      cost: 'medium',
      duration: '30 min-1 hour',
      mode: 'Flight',
      viewIsSelected: true,
      boxColor: Color(0xff9DCEFF)));

    transport.add(TransportModel(
      name: 'Kumili',
      iconPath: 'assets/icons/hill.png',
      cost: 'low',
      duration: '6-7 hours',
      mode: 'Train',
      viewIsSelected: true,
      boxColor: Color(0xffEEA4CE),
    ));
    return transport;
  }
}
