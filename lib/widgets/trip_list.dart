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
    return Column(
      children: [
        ListTile(
            title: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${trips.night} nights",style: TextStyle(fontWeight: FontWeight.w400,color: Color.fromARGB(255, 70, 132, 72))),
                SizedBox(height: 10,),
                Text("travel to ${trips.title}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),)
              ],
            ),
            leading: Image.asset(trips.imgs),
            trailing: Text(trips.price,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TripDetails(trip: trips,),
                  ));
            }),
            SizedBox(height: 20,)
      ],
    );
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
