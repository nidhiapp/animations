import 'package:animations/animation_controllers.dart';
import 'package:animations/models/trip.dart';
import 'package:flutter/material.dart';

class TripDetails extends StatelessWidget {
  final Trips trip;
  TripDetails({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              child: Hero(tag: 'location-imgs-${trip.imgs}',
                child: Image.asset(
                  "${trip.imgs}",
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text(
                trip.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
              ),
              subtitle: Text(
                '${trip.night} night stay for only \$${trip.price}',
                style: TextStyle(letterSpacing: 1),
              ),
              trailing: SizedBox(
                width: 100, // Set the desired width for AnimationControllerPrac
                child: AnimationControllerPrac(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                "dhbsbcfjshdbcfjhsbcsd",
                style: TextStyle(
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
