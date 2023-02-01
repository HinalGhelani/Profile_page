import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:outcaster_5/Global.dart';
import 'Profile_Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'myApp': (context) => const MyApp(),
        'profile': (context) => const ProfilePage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Page",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff89CB8E), Color(0xff54B6F8)])),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: NetworkImage(
                  "https://img.freepik.com/free-icon/user_318-873799.jpg?w=360",
                  scale: 2),
            ),
            const SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed('myApp');
                });
              },
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                  color: const Color(0xff489ED6),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Create Profile",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

enum Gender { male, female }

class _MyAppState extends State<MyApp> {
  DateTime dateTime = DateTime.now();

  getImage() async {
    PickedFile? pic = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pic != null) {
      setState(() {
        Global.image = File(pic.path);
      });
    }
  }

  setImage() async {
    PickedFile? pic = await ImagePicker().getImage(source: ImageSource.camera);
    if (pic != null) {
      setState(() {
        Global.image = File(pic.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Page",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff89CB8E), Color(0xff54B6F8)])),
        ),
      ),
      body: Stepper(
        currentStep: Global.i,
        controlsBuilder: (context, _) {
          return Row(
            children: [
              (Global.i == 10)
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pushNamed('profile');
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                      ),
                      child: const Text("ADD"),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Global.i++;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                      ),
                      child: const Text("Continue"),
                    ),
              const SizedBox(width: 10),
              (Global.i == 0)
                  ? Container()
                  : ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (Global.i > 0) {
                            Global.i--;
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                      ),
                      child: const Text("Cancel")),
            ],
          );
        },
        steps: <Step>[
          Step(
            title: const Text("Profile Picture"),
            content: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                (Global.image == null)
                    ? CircleAvatar(
                        radius: 58,
                        backgroundColor: Colors.grey.shade300,
                        child: const Text(
                          "ADD",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),
                        ),
                      )
                    : CircleAvatar(
                        radius: 58,
                        backgroundColor: Colors.grey.shade400,
                        backgroundImage: Image.file(
                          Global.image!,
                          fit: BoxFit.cover,
                        ).image,
                      ),
                Align(
                  alignment: const Alignment(-0.45, -8),
                  child: SizedBox(
                    height: 25,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              getImage();
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: const Text(
                                            "Gallery",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              setImage();
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: const Text(
                                            "Camera",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.indigo,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                )
              ],
            ),
          ),
          Step(
            title: const Text("Name"),
            content: TextFormField(
              controller: Global.nameC,
              onChanged: (val) {
                setState(() {
                  Global.name = val;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "please enter this";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
            ),
          ),
          Step(
            title: const Text("Phone"),
            content: TextFormField(
              controller: Global.phoneC,
              onChanged: (val) {
                setState(() {
                  Global.phone = val;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "please enter this";
                }
                return null;
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Phone Number",
              ),
            ),
          ),
          Step(
            title: const Text("Email"),
            content: TextFormField(
              controller: Global.emailC,
              onChanged: (val) {
                setState(() {
                  Global.email = val;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "please enter this";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email Address",
              ),
            ),
          ),
          Step(
            title: const Text("Date of Birth"),
            content: TextFormField(
              controller: Global.birthDate,
              onTap: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  firstDate: DateTime(1970),
                  lastDate: DateTime.now(),
                );
                if (date != null && date != dateTime) {
                  setState(() {
                    Global.dob = DateFormat("dd-MMM-yyyy").format(date);
                    dateTime = date;
                    Global.birthDate.text = Global.dob;
                  });
                }
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "please enter this";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "DD/MM/YYYY",
              ),
            ),
          ),
          Step(
            title: const Text("Gender"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RadioListTile(
                  value: 'male',
                  title: const Text("Male"),
                  groupValue: Global.gender,
                  onChanged: (val) {
                    setState(() {
                      Global.gender = val.toString();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
                RadioListTile(
                  value: 'female',
                  title: const Text("Female"),
                  groupValue: Global.gender,
                  onChanged: (val) {
                    setState(() {
                      Global.gender = val.toString();
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
          Step(
            title: const Text("Current Location"),
            content: TextFormField(
              controller: Global.locateC,
              onChanged: (val) {
                setState(() {
                  Global.locate = val;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "please enter this";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Location",
              ),
            ),
          ),
          Step(
            title: const Text("Nationalities"),
            content: TextFormField(
              controller: Global.nationC,
              onChanged: (val) {
                setState(() {
                  Global.nation = val;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "please enter this";
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Nationalities"),
            ),
          ),
          Step(
            title: const Text("Religion"),
            content: TextFormField(
              controller: Global.religionC,
              onChanged: (val) {
                setState(() {
                  Global.religion = val;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "please enter this";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Religion",
              ),
            ),
          ),
          Step(
            title: const Text("Languages"),
            content: Column(
              children: [
                CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: Global.first,
                    onChanged: (val) {
                      setState(() {
                        Global.first = val!;
                        if (Global.first) {
                          Global.l.add('English');
                        } else {
                          Global.l.remove('English');
                        }
                      });
                    },
                    activeColor: Colors.blue,
                    title: const Text("English")),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: Global.second,
                  onChanged: (val) {
                    setState(() {
                      Global.second = val!;
                      if (Global.second) {
                        Global.l.add('Hindi');
                      } else {
                        Global.l.remove('Hindi');
                      }
                    });
                  },
                  activeColor: Colors.blue,
                  title: const Text("Hindi"),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: Global.third,
                  onChanged: (val) {
                    setState(() {
                      Global.third = val!;
                      if (Global.third) {
                        Global.l.add('Gujarati');
                      } else {
                        Global.l.remove('Gujarati');
                      }
                    });
                  },
                  activeColor: Colors.blue,
                  title: const Text("Gujarati"),
                ),
              ],
            ),
          ),
          Step(
            title: const Text("Biography"),
            content: TextFormField(
              controller: Global.bioC,
              onChanged: (val) {
                setState(() {
                  Global.bio = val;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "please enter this";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Biography",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
