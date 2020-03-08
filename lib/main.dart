import 'package:flutter/material.dart';
import 'package:futurebuilder/DetailedView.dart';
import 'package:provider/provider.dart';
import 'Statemanagement/StateProvider.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue,
    //  statusBarBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StateManager>(create: (_) => StateManager()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final statemanager = Provider.of<StateManager>(context);

    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: Text('Local Json Parsing'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: statemanager.fetchJson(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.error == true) {
              return Container(
                child: Center(
                  child: Text("Some Problem"),
                ),
              );
            } else if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading"),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data[index].thumbnailUrl),
                        ),
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].url),
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => DetailedView(
                                      album: snapshot.data[index])));
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
