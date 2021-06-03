import 'package:flutter/material.dart';
class InfraPage extends StatelessWidget {
  // HomePage({Key key, this.title}) : super(key: key);
  // final String title;
  // final PlanetService planetService = PlanetService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oi"),
      ),
      // body: ListView(
      //   children: planetService.planets.map((planet) {
      //     return PlanetListTile(
      //       planet: planet,
      //       subtitle: Text("${planet.distanceFromTheSun} AU do sol."),
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //             builder: (_) => SinglePage(planet: planet),
      //           ),
      //         );
      //       },
      //     );
      //   }).toList(),
      // ),
    );
  }
}