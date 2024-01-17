import 'package:animations/models/trip.dart';
import 'package:animations/trip_details.dart';
import 'package:flutter/material.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> tripTiles = [];
  final GlobalKey _listKey = GlobalKey();

  void _addTrips() {
    List<Trips> trips = [
      const Trips(
          title: "mumbai",
          night: "2",
          price: "\$50",
          imgs: "assets/images/flower.png"),
      const Trips(
          title: "delhi",
          night: "3",
          price: "\$50",
          imgs: "assets/images/flower.png"),
      const Trips(
          title: "pune",
          night: "2",
          price: "\$50",
          imgs: "assets/images/flower.png"),
      const Trips(
          title: "banglore",
          night: "2",
          price: "\$50",
          imgs: "assets/images/flower.png")
    ];
    for (var trip in trips) {
      tripTiles.add(buildTile(trip));
    }
  }

  Widget buildTile(Trips trips) {
    return ListTile(
        title: Column(
          children: [Text("${trips.night} nights")],
        ),
        leading: Image.asset(trips.imgs),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TripDetails(trip: trips,),
              ));
        });
  }

  @override
  void initState() {
    _addTrips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: tripTiles.length,
        itemBuilder: (context, index) {
          return tripTiles[index];
        });
  }
}
