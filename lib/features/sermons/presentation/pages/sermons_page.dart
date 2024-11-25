import 'package:flutter/material.dart';
import 'package:podcast_project/core/widgets/appbar.dart';

class SermonPage extends StatefulWidget {
  const SermonPage({super.key});

  @override
  State<SermonPage> createState() => _SermonPageState();
}

class _SermonPageState extends State<SermonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("NOS SERMENTS"),
      body: SafeArea(
        child: Center(
          child: Text("SERMONS page"),
        ),
      ),
    );
  }
}