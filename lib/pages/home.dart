import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

   data = ModalRoute.of(context).settings.arguments;
   print(data);

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,100,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit location'),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
