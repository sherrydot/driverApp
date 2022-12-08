import 'package:driver_app/global/global.dart';
import 'package:driver_app/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget {
  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {

  TextEditingController capacityTextEditingController = TextEditingController();
  TextEditingController numberPlateTextEditingController = TextEditingController();


  String? selectedCarType;

  saveCarInfo() {
    Map driverCarInfoMap = {
      "Number_Plate": numberPlateTextEditingController.text.trim(),
      "tank_capacity": capacityTextEditingController.text.trim(),
    };
    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
    driversRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);
    Fluttertoast.showToast(msg: "Congratulations! Tank details have been saved.");
    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [

              const SizedBox(height: 24,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('images/logo1.png'),
              ),

              const SizedBox(height: 10,),

              const Text(
                'Tank Details',
                style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),),
              TextField(
                controller: capacityTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: 'Tank Capacity',
                  hintText: 'Capacity in Liters',

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,),

                ),

              ),

              TextField(
                controller: numberPlateTextEditingController,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                  labelText: 'Tank Number Plate',
                  hintText: 'Number Plate',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,),

                ),

              ),

              const SizedBox(height: 120,),

              ElevatedButton(
                onPressed: (){
                  if(numberPlateTextEditingController.text.isNotEmpty
                      && capacityTextEditingController.text.isNotEmpty != null){
                    saveCarInfo();
                  }
                  //Navigator.push(context, MaterialPageRoute(builder: (c)=>CarInfoScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text(
                  'Save Now',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),),],
          ),
        ),
      ),
    );
  }
}
