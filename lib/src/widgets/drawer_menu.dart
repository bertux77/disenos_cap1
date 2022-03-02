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
      backgroundColor: appTheme.currentTheme.dialogBackgroundColor,
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
                  child: CircleAvatar(
                    backgroundColor: appTheme.currentTheme.colorScheme.secondary,
                    radius: 50,
                    child: const FaIcon(
                      FontAwesomeIcons.theaterMasks,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              
                Text(
                  'Alberto Carrión',
                  style: TextStyle(
                      fontSize: 18,
                      color: appTheme.currentTheme.colorScheme.secondary,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            const SizedBox(height: 15,),
            const Expanded(
              child: _ListaDrawerMenu(),
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: appTheme.currentTheme.colorScheme.secondary,
              ),
              title: const Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: appTheme.currentTheme.colorScheme.secondary,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),
            SafeArea(
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: appTheme.currentTheme.colorScheme.secondary,
                ),
                title: const Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currentTheme.colorScheme.secondary,
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
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.colorScheme.secondary,
        ),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.colorScheme.secondary,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));
        },
      ),
    );
  }
}
