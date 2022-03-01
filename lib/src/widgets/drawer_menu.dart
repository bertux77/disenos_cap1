import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[50],
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              child: const CircleAvatar(
                backgroundColor: Color(0xff536cf6),
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
                  color: Color(0xff536cf6),
                  fontWeight: FontWeight.bold),
            ),
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
                value: true,
                activeColor: Colors.blue,
                onChanged: (value) {},
                //onChanged: (value) {}),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.add_to_home_screen,
                color: Colors.blue,
              ),
              title: const Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value) {},
                //onChanged: (value) {}),
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
      itemCount: 20,
      itemBuilder: (context, i) => const ListTile(
        leading: FaIcon(
          FontAwesomeIcons.slideshare,
          color: Colors.blue,
        ),
        title: Text('Hola Mundo'),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.blue,
        ),
        //onTap: () {},
      ),
    );
  }
}
