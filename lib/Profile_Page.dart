import 'package:flutter/material.dart';

import 'Global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xffFF9505), Color(0xffFF402A)],
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            const SizedBox(height: 50),
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              backgroundImage: Image.file(
                                Global.image!,
                                fit: BoxFit.cover,
                              ).image,
                            ),
                            const SizedBox(height: 20),
                             Text(
                              Global.name,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              Global.email,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 1.15),
                  child: Container(
                    height: 55,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color(0xffC459E6),
                            Color(0xffE45175),
                          ]
                      ),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 17),
                        const Text(
                          "Back to Home",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children:  [
                    ListTile(
                      leading: const Icon(Icons.person,size: 35,),
                      title: const Text("Name"),
                      subtitle: Text(Global.name),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone,size: 35,),
                      title: const Text("Mobile"),
                      subtitle: Text(Global.phone),
                    ),
                    ListTile(
                      leading: const Icon(Icons.mail,size: 35,),
                      title: const Text("Email"),
                      subtitle: Text(Global.email),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on,size: 35,),
                      title: const Text("Address"),
                      subtitle: Text(Global.locate),
                    ),
                    ListTile(
                      leading: const Icon(Icons.cake,size: 35,),
                      title: const Text("DOB"),
                      subtitle: Text(Global.dob),
                    ),
                    ListTile(
                      leading: const Icon(Icons.male,size: 35,),
                      title: const Text("Gender"),
                      subtitle: Text(Global.gender),
                    ),
                    ListTile(
                      leading: const Icon(Icons.flag,size: 35,),
                      title: const Text("Nationalities"),
                      subtitle: Text(Global.nation),
                    ),
                    ListTile(
                      leading: const Icon(Icons.flag,size: 35,),
                      title: const Text("Religion"),
                      subtitle: Text(Global.religion),
                    ),
                    ListTile(
                      leading: const Icon(Icons.language,size: 35,),
                      title: const Text("Languages"),
                      subtitle: Text(Global.l.join(',')),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person,size: 35,),
                      title: const Text("Biography"),
                      subtitle: Text(Global.bio),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
