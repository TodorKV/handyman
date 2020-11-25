import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapid_design/services/auth_service.dart';
import './inter_exter_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    backgroundColor: Color.fromRGBO(184, 15, 10, 1),
                  ),
                ),
                accountEmail: Text('Имейл'),
                accountName: Text('Име'),
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Color.fromRGBO(184, 15, 10, 1),
                ),
                title: Text(
                  "Излизане",
                ),
                onTap: () {
                  context.read<AuthenticationService>().signOut();
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.gavel), text: "Интериор"),
              Tab(icon: Icon(Icons.build), text: "Екстериор"),
              //Tab(icon: Icon(Icons.directions_bike)),
            ],
            indicatorColor: Color.fromRGBO(95, 2, 31, 1),
          ),
          title: Text('Услуги'),
        ),
        body: TabBarView(
          children: [
            InterExterScreen(show: true),
            InterExterScreen(show: false),
          ],
        ),
      ),
    );
  }
}
