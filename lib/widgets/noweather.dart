import 'package:flutter/material.dart';

class NoweatherPage extends StatefulWidget {
  const NoweatherPage({super.key});

  @override
  State<NoweatherPage> createState() => _NoweatherPageState();
}

class _NoweatherPageState extends State<NoweatherPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(45),
      child:  Center(
        child: Text('There is no weather😔  Start searching now 🔍',style: TextStyle(color: Colors.black,fontSize: 30),),
      ),
    );
  }
}
