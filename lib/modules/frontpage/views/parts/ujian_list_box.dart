// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:xcbt/configs/all_configs.dart';

class UjianListBox extends StatelessWidget {
  final List<Map<String, dynamic>> listData;

  UjianListBox({
    Key? key,
    required this.listData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container( 
        height: 100,
        color: kBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              color: kYellow,
            ),
            Text('Test'),
          ],
        ),
      ),
    );
  }
}
