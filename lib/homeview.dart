import 'package:farmkeep/records.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:flutter/material.dart';

import 'griditem.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        //drawer color
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),

        title: RichText(
          text: const TextSpan(children: <TextSpan>[
            TextSpan(text: 'Farm', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green)),
            TextSpan(text: 'Keep', style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic, color: Colors.green)),
          ]),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
            child: CircleAvatar(backgroundImage: NetworkImage('https://media.istockphoto.com/photos/one-beautiful-woman-looking-at-the-camera-in-profile-picture-id1303539316?b=1&k=20&m=1303539316&s=170667a&w=0&h=ePGGvjsOR__-R2KSvZ67xXl2x-CkVzKg8q_WtvqLww0=')),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(5.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(text: 'Record book for', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(text: 'Farm1', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.green)),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber[400]),
                    onPressed: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: Container(
                                  height: MediaQuery.of(context).size.height * 0.5,
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: Column(
                                    children: [
                                      QrImage(
                                        data: "1234567890",
                                        version: QrVersions.auto,
                                        size: 200.0,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('Scan QR code to download record book',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Close',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                              )))
                                    ],
                                  )),
                            );
                          });
                    },
                    child: Row(children: [
                      const Text('GENERATE QR CODE',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )),
                      const Icon(
                        Icons.qr_code,
                        color: Colors.black,
                        size: 20,
                      ),
                    ])),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          OrientationBuilder(builder: (context, orientation) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: GridItem(),
                );
              },
              itemCount: 10,
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddItem()));
          },
          backgroundColor: Colors.yellow[600],
          child: Icon(
            Icons.add,
          )),
    );
  }
}
