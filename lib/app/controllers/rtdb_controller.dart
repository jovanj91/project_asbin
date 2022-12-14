import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';


class RtdbController extends GetxController {
  late DatabaseReference _dbref;
  var databasejsonBerat = "0.0".obs;
  var databasejsonJarak = "0.0".obs;
  var databasejsonKapasitas = "0.0".obs;
  late bool opened;
  @override
  void onInit() {
    // TODO: implement initState
    super.onInit();
    _dbref = FirebaseDatabase.instance.ref();
    //read lock
    _dbref.child("databaseAsbin").child("control").child("lock").onValue.listen((event){
      final dataSnapshot = event.snapshot;
      var lock = int.parse(dataSnapshot.value.toString());
      if (lock == 1){
        opened = true;
      }else{ 
        opened = false;
      }
    });
    //read data
    _dbref.child("databaseAsbin").child("control").child("tSampah").onValue.listen((event) { 
      final dataSnapshot = event.snapshot;
      databasejsonJarak.value = dataSnapshot.value.toString();      
    });
    _dbref.child("databaseAsbin").child("control").child("bSampah").onValue.listen((event) { 
      final dataSnapshot = event.snapshot;
      databasejsonBerat.value = dataSnapshot.value.toString();
    });
    
    _dbref.child("databaseAsbin").child("control").child("kapasitas").onValue.listen((event) { 
      final dataSnapshot = event.snapshot;
      databasejsonKapasitas.value = dataSnapshot.value.toString();
   
    });
  }

  void LockOpen() {
      _dbref.child("databaseAsbin").child("control").update( { "lock": 1});

  }
  void LockClose() {
    _dbref.child("databaseAsbin").child("control").update( { "lock": 0});
  }

  RxString persJString(){
    RxString hasil="".obs;
    var i = (double.parse(databasejsonJarak.value))/37* 100;
    int a = i.round();
    hasil.value = a.toString();
    return hasil;
  }
  
  RxString persWString(){
    RxString hasil="".obs;
    var i = (double.parse(databasejsonBerat.value))/3000 * 100;
    int a = i.round();
    hasil.value = a.toString();
    return hasil;
  }

  double persJ(){
    var i = (double.parse(databasejsonJarak.value)/37 )* 1;
    return i;
  }

  double persW(){
    var i = (double.parse(databasejsonBerat.value)/3000 )* 1;
    return i;
  }

  RxString persCString(){
    RxString hasil="".obs;
    var i = (double.parse(databasejsonKapasitas.value));
    int a = i.round();
    hasil.value = a.toString();
    return hasil;
  }
  double persC(){
    var i = (double.parse(databasejsonKapasitas.value)/100);
    return i;
  }
  
 
}
