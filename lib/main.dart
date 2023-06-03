import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
      brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.cyan,
    ),
  home: MyApp(),
  ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String pname, gen, mail, mob;

  get name => null;

  get gender => null;

  get email => null;

  get mobile => null;

  getname(pname) {
    this.pname = pname;
  }

  getgender(gen) {
    this.gen = gender;
  }

  getemail(mail) {
    this.mail = email;
  }

  getmobile(mob) {
    this.mob = mobile;
  }

  createData(){
    print("created");

    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("Crud").doc("P1");

    Map<String, dynamic> stu1={
      "name": name,
      "gender" : gender,
      "email" : email,
      "mobile" : mobile

    };
    documentReference.set(stu1).whenComplete((){
      print("$name created");
    });
  }

  readData(){
    print("read");
  }

  updateData(){
    print("updated");
  }

  deleteData(){
    print("deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter crud project"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2.0))),
                onChanged: (String pname) {
                  getname(pname);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "gender",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2.0))),
                onChanged: (String gen) {
                  getgender(gen);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "email",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2.0))),
                onChanged: (String mail) {
                  getemail(mail);
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "mobile",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue,
                            width: 2.0))),
                onChanged: (String mob) {
                  getmobile(mob);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ElevatedButton
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                        padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 14, color: Colors.white))),
                    onPressed: () {
                      createData();
                    },
                    child: const Text('Create')),


                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 14, color: Colors.white))),
                    onPressed: () {
                      readData();
                    },
                    child: const Text('Read')),

                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.orange),
                        padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 14, color: Colors.white))),
                    onPressed: () {
                      updateData();
                    },
                    child: const Text('Update')),

                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding:
                        MaterialStateProperty.all(const EdgeInsets.all(15)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 14, color: Colors.white))),
                    onPressed: () {
                      deleteData();
                    },
                    child: const Text('Delete')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

