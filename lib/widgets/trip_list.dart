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
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

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
          imgs: "assets/images/moon.png"),
      const Trips(
          title: "pune",
          night: "2",
          price: "\$50",
          imgs: "assets/images/pinkforest.png"),
      const Trips(
          title: "banglore",
          night: "2",
          price: "\$50",
          imgs: "assets/images/girl.png")
    ];
    Future ft = Future(() {});
    for (var trip in trips) {
      ft = ft.then((value) {
        return Future.delayed(Duration(seconds:1), () {
              tripTiles.add(buildTile(trip));
      _listKey.currentState!.insertItem(tripTiles.length - 1);
        });
      });
    }
  }

  Widget buildTile(Trips trips) {
    return Column(
      children: [
        ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${trips.night} nights",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 70, 132, 72))),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "travel to ${trips.title}",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: 'location-img-${trips.imgs}',
                child: Image.asset(
                  trips.imgs,
                  fit: BoxFit.cover,
                  height: 150,
                  width: 100,
                ),
              ),
            ),
            trailing: Text(
              trips.price,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TripDetails(
                      trip: trips,
                    ),
                  ));
            }),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addTrips();
    });

    super.initState();
  }

  Tween<Offset> offset = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
            child: tripTiles[index], position: animation.drive(offset));
      },
    );
  }
}
