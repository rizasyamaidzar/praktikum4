import 'package:flutter/material.dart';
import 'package:praktikum4/widgets/inputSuhu.dart';
import 'package:praktikum4/widgets/konversiSuhu.dart';
import 'package:praktikum4/widgets/riwayat.dart';
import 'package:praktikum4/widgets/targetPerhitungan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController suhu = new TextEditingController();
  //variabel berubah
  double inputUser = 0;
  String selectedValue = 'Kelvin';
  List<String> dropdownItems = ['Kelvin', 'Reamur','Fahrenheit'];
  double nilai = 0;
  List<String> listViewItem = [];
  void konversiSuhu() {
    return setState(() {
      if(suhu.text.isNotEmpty){
      inputUser = double.parse(suhu.text);
      if (selectedValue == "Kelvin") {
        inputUser += 273.15;
      } else if(selectedValue=="Reamur") {
        inputUser = inputUser * (4 / 5) ;
      }else{
       inputUser = (inputUser * 9/5)+32;
      }
      listViewItem.add("$selectedValue : " + "$inputUser");
    }
    });
  }
  void onDropdownChanged(Object? value){
    return setState(() {
      selectedValue = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Konverter Suhu",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          body: Column(
            children: [
              InputSuhu(suhu: suhu),
              SizedBox(height: 10),
              TargetPerhitungan(
                selectedValue: selectedValue, 
                dropdownItems: dropdownItems, onDropdownChanged: onDropdownChanged,
                ),
              Text("Hasil",style: TextStyle(
                fontSize: 40,
              ),),
              Text("$inputUser",style: TextStyle(fontSize: 50),),
              KonversiSuhu(onPressed: konversiSuhu,),
              SizedBox(height: 10,),
              Text("Konversi Suhu",
                style: TextStyle(fontSize:25)),
              RiwayatPerhitungan(listViewItem: listViewItem)
            ],
          ),
        ));
  }
}








