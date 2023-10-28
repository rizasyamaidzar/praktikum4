import 'package:flutter/material.dart';

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
  String jenisSuhu = '';
  double inputUser = 0;
  String selectedValue = 'Kelvin';
  List<String> dropdownItems = ['Kelvin', 'Reamur','Fahrenheit'];
  double nilai = 0;
  List<String> listViewItem = [];
  void konversiSuhu() {
    return setState(() {
      if(suhu.text.isNotEmpty){
      inputUser = double.parse(suhu.text);
      if (jenisSuhu == "Kelvin") {
        inputUser += 273.15;
      } else if(jenisSuhu=="Reamur") {
        inputUser = (4 / 5) * inputUser;
      }else{
       inputUser = (inputUser * 9/5)+32;
      }
      listViewItem.add("$jenisSuhu : " + "$inputUser");
    }
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
              TextFormField(
                textAlign: TextAlign.center,
                controller: suhu,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Input celcius"
                ),
              ),
              SizedBox(height: 10),
              DropdownButton(
                  value: selectedValue,
                  items: dropdownItems.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedValue = "$value";
                      jenisSuhu = "$value";
                    });
                  }),
              Text("Hasil",style: TextStyle(
                fontSize: 40,
              ),),
              Text("$inputUser",style: TextStyle(fontSize: 50),),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 1000,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 110, 253), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    konversiSuhu();
                  },
                  child: Text('Konversi suhu'),
                ),
              ),
              SizedBox(height: 10,),
              Text("Konversi Suhu",
                style: TextStyle(fontSize:25)),
              Expanded(
                  child: ListView.builder(
                      itemCount: listViewItem.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Text(listViewItem[index],style: TextStyle(
                            fontSize: 20
                          ),)
                          );
                      }))
            ],
          ),
        ));
  }
}
