import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(Icons.restaurant, 'Meals'),
          buildListTile(Icons.settings, 'Filters'),
        ],
      ),
    );
  }

  ListTile buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: GoogleFonts.robotoCondensed(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }
}
