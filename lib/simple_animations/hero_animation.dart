import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({required this.name, required this.age, required this.emoji});
}

const List people = [
  Person(name: "john", age: 20, emoji: "😂"),
  Person(name: "jinny", age: 25, emoji: "😍"),
  Person(name: "james", age: 23, emoji: "🥳"),
];

class HeroAnimationsScreen extends StatelessWidget {
  const HeroAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("People"),
      ),
      body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            return Column(
              children: [
                ListTile(
                  title: Text(person.name),
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                    person: person,
                                  )));
                    },
                    child: Hero(
                      tag: person.name,
                      child: Text(
                        person.emoji,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  trailing: Text("${person.age} years old"),
                ),
                Divider()
              ],
            );
          }),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final Person person;
  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Hero(
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return ScaleTransition(
                      scale: animation.drive(Tween<double>(begin: 0.0, end: 5.0).chain(CurveTween(curve: Curves.fastOutSlowIn))),
                      child: Material(
                        color: Colors.transparent,
                        child: toHeroContext.widget),
                    );
      
                  case HeroFlightDirection.pop:
                    return Material(
                      color: Colors.transparent,
                      child: fromHeroContext.widget);
                }
              },
              tag: person.name,
              child: Text(
                "${person.emoji}",
                style: TextStyle(fontSize: 40),
              )),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                person.name,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Text(
                person.age.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
