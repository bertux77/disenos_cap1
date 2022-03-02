import 'package:cap1/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';

class CustomDrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
      backgroundColor: Colors.blue[50],
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'home');
              },
              child: Column(
                children: [
            
                Container(
                  child: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 50,
                    child: FaIcon(
                      FontAwesomeIcons.theaterMasks,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              
                const Text(
                  'Alberto Carrión',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            const SizedBox(height: 15,),
            const Expanded(
              child: _ListaDrawerMenu(),
            ),
            ListTile(
              leading: const Icon(
                Icons.lightbulb_outline,
                color: Colors.blue,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: Colors.blue,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
            SafeArea(
              child: ListTile(
                leading: const Icon(
                  Icons.add_to_home_screen,
                  color: Colors.blue,
                ),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListaDrawerMenu extends StatelessWidget {
  const _ListaDrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => const Divider(
        color: Colors.blue,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: Colors.blue,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}
