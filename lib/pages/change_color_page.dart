import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColorPage extends StatefulWidget {
  const ChangeColorPage({Key? key}) : super(key: key);

  @override
  _ChangeColorPageState createState() => _ChangeColorPageState();
}

class _ChangeColorPageState extends State<ChangeColorPage> {
  Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeColor();
      },
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: backGroundColor,
      title: const Text("Tap to change color"),
    );
  }

  _buildBody() {
    return const Center(
      child: Text(
        'Hello There',
        style: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  void changeColor() {
    int generatedColor = Random().nextInt(Colors.primaries.length);
    backGroundColor = Colors.primaries[generatedColor];

    setState(() {
      backGroundColor;
    });
  }

  @override
  void initState() {
    super.initState();
    changeColor();
  }
}
