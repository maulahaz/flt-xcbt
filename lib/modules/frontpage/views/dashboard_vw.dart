import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('FIC-10 :: CBT - TPA'),),
      body: Center(child: Text('By Abu Ahyar'),),
    );
  }
}