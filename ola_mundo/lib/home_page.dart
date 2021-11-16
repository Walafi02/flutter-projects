import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: ClipOval(
                  // ClipRRect(
                  // borderRadius: BorderRadius.circular(45),
                    child: Image.network(
                        "https://avatars.githubusercontent.com/u/26489511?s=96&v=4")),
                accountName: Text("Walafi Ferreira"),
                accountEmail: Text("walafif@yahoo.com")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
              subtitle: Text("subTitle"),
              onTap: () {
                print("home");
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logoout"),
              subtitle: Text("Sair do App"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [CustonSwitch()],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Text("contador: $count"),
            Container(
              height: 16,
            ),
            CustonSwitch(),
            Container(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
    );
  }
}

class CustonSwitch extends StatelessWidget {
  const CustonSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instace.isDarkTheme,
        onChanged: (value) {
          AppController.instace.changeTheme();
        });
  }
}
