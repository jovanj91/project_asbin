import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class realtime_db extends StatefulWidget {
  @override
  
  State<realtime_db> createState() => _realtime_dbState();
}

class _realtime_dbState extends State<realtime_db> {
  late DatabaseReference _dbref;
  String databasejson = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text( " database - " + databasejson),
            ),
            TextButton(    onPressed: () {
                  _createDB();
                }, child: Text(" create DB")),
            TextButton(    onPressed: () {
                  _readdb_once();
                }, child: Text("read all DB")),
            TextButton(    onPressed: () {
                  _readdb_onechild();
                }, child: Text("read one db")),
            TextButton(    onPressed: () {
                  _updatevalue();
                }, child: Text("update data")),
            
          ],
        ),
      ),
    ),
  );
  }
  _createDB(){
    //_dbref.child('Movies').push().set({"movie title":'lala'});
    _dbref.child("profile").set("jovan josafat");
    _dbref.child("job profile").set({'website': "facebook.com", 'website2': "youtube.com"});

  }
  _readdb_once() {
    _dbref.once().then((event){
      final dataSnapshot = event.snapshot;
      print("read once- " + dataSnapshot.value.toString());
      setState(() {
        databasejson = dataSnapshot.value.toString();
      });
    });
  }
  _readdb_onechild(){
    _dbref.child("dataSensor").child("jarak").onValue.listen((event) { 
      final dataSnapshot = event.snapshot;
      print("read once-" + dataSnapshot.value.toString());
      setState(() {
        databasejson = dataSnapshot.value.toString();
      });
    });
    
  }
  _updatevalue(){
    _dbref.child("job profile").update( { "website2": "www.dripcoding.com"});
  }
}