// ignore_for_file: unused_import, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, unused_element, sort_child_properties_last

import 'package:arjun/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:arjun/models/category_model.dart';
import 'package:arjun/models/transport_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];
  List<TransportModel> transport = [];

  void _getCatergories() {
    categories = CategoryModel.getCategories();
  }

  void _getTransport() {
    transport = TransportModel.getTransport();
  }

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    transport = TransportModel.getTransport();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            SizedBox(height: 40),
            _categoriesSection(),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Suggested Packages',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
                height: 200,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                          width: 200,
                          decoration: BoxDecoration(
                              color: transport[index].boxColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Image.asset(transport[index].iconPath,
                                height: 50, width: 30),
                            Text(
                              transport[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            Text(
                              transport[index].mode +
                                  ' | ' +
                                  transport[index].duration +
                                  ' | ' +
                                  transport[index].cost,
                              style: TextStyle(
                                color: Color(0xff786F72),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 45,
                              width: 130,
                              child: Center(
                                  child: GestureDetector(
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FlightModel()));
                                },
                              )),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff9DCEFF),
                                    Color(0xff92A3FD)
                                  ]),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ]));
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 25),
                    itemCount: transport.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20, right: 20))),
          ],
        )));
  }

  Column _categoriesSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 40,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Category',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )),
          SizedBox(
            height: 15,
          ),
          SizedBox(
              height: 115,
              child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 25,
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: categories[index].boxColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(categories[index].iconPath),
                            ),
                          ),
                          Text(
                            categories[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 19),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    );
                  }))
        ],
      )
    ]);
  }

  Container _searchField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
          decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        hintText: 'Search the place here',
        hintStyle: TextStyle(color: Color(0xffDDDADA), fontSize: 15),
        prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.search, color: Colors.black)),
        suffixIcon: SizedBox(
          width: 100,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.1,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.filter_list_alt, color: Colors.black)),
              ],
            ),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      )),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Touraid',
        style: TextStyle(
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.black,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 224, 224),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 224, 224),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
