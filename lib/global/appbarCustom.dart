import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class appbarCustom extends StatefulWidget {
  const appbarCustom({super.key});

  @override
  State<appbarCustom> createState() => _appbarCustomState();
}

class _appbarCustomState extends State<appbarCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(),
      appBar: new AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    );
  }
}
