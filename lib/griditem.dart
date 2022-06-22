import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Stack(children: [
      Column(children: [
        Image.network('https://media.istockphoto.com/photos/peanuts-picture-id1375389429?b=1&k=20&m=1375389429&s=170667a&w=0&h=B-wPW1cB9R9Q6iSVSA-dEgUvP9xLwtJkDd5KpobJ7bw='),
        SizedBox(
          height: 10,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Groundnut',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              SizedBox(
                height: 5,
              ),
              const Material(
                  shape: RoundedRectangleBorder(side: BorderSide(color: Colors.green)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Harvest',
                      style: TextStyle(color: Colors.green),
                    ),
                  )),
            ],
          ),
          Text('5 May',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ])
      ])
    ]));
  }
}
