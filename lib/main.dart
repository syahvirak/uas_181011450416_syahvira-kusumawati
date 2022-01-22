import 'package:flutter/material.dart';
import 'package:uas_1801011450416_syahvira_kusumawati/model.dart';
import 'package:uas_1801011450416_syahvira_kusumawati/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  Service service = Service();
  Weather weather = Weather();
  bool isFetch = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('181011450416 - Syahvira Kusumawati'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: 50,
                            ),
                            width: 248,
                            height: 50,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: controller,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hoverColor: Colors.blue[200],
                                hintText: "Masukkan Nama Kota",
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Colors.blue[100]),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Row(children: <Widget>[
                            ElevatedButton(
                              onPressed: () async {
                                isFetch = true;
                                weather = await service
                                    .fetchData(controller.text);
                                setState(() {});
                              },
                              child: Text("Cari"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[800],
                                minimumSize: Size(150, 50),
                              ),
                            ),
                          ]),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: isFetch
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                        'http://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                                    // Text(
                                    //   '${weather.temp}°C',
                                    //   style: TextStyle(
                                    //     fontSize: 40,
                                    //   ),
                                    // ),
                                    Text(
                                      weather.name +
                                          " is " +
                                          weather.description,
                                      // style: TextStyle(
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                    )
                                  ],
                                )
                              : SizedBox(
                                  child: Text(
                                    "Cari Cuaca Terlebih Dahulu",
                                    style: TextStyle(color: Colors.blue[200]),
                                  ),
                                ),
                        ),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: Column(
                                      children: [
                                        Text('Suhu'),
                                        Text('Kecepatan Angin'),
                                        Text('Longtitude'),
                                        Text('Latitude'),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 0,
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text('${weather.temp.toString()}'),
                                    Text('${weather.wind.toString()}'),
                                    Text(weather.long.toString()),
                                    Text(weather.lat.toString()),
                                  ],
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

