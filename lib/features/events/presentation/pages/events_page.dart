import 'package:flutter/material.dart';
import 'package:podcast_project/core/widgets/appbar.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("EVENTS"),
     body: SafeArea(
        child: Center(
          child: Text("SERMONS page"),
        ),
      ),
    );
  }
}