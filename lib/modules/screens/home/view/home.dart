import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/api_helper.dart';
import '../../../model/categorymodel.dart';
import '../../../utils/global.dart';

class Home extends StatelessWidget {
  Home({super.key});
  Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Container(
        color: Color(0xffFFFFFF),
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 70,
                ),
                CircleAvatar(
                  radius: 40,
                  foregroundImage: AssetImage(
                    "lib/modules/assets/logo.png",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "bhavin@gmail.com",
                  style: Global.size12,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Explore",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Vapes",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Extracts",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Edibles",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Flowres",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Accessories",
                  style: Global.size17black,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamedUntil('/login', (route) => false);
                  },
                  child: Text(
                    "Logout",
                    style: Global.size12red,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Image.asset("lib/modules/assets/logo horozontal.png"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
          CircleAvatar(
            child: Image.asset("lib/modules/assets/logo.png"),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: FutureBuilder(
        future: Api_Helper.api.fetchCatagory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Catagory_Model>? catagory = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset("lib/modules/assets/Group 60.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    flex: 3,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: catagory!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 248,
                          crossAxisSpacing: 0,
                        ),
                        itemBuilder: (ctx, i) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                '/detail',
                                arguments: catagory![i],
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.network("${catagory[i].image}"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${catagory[i].category}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
