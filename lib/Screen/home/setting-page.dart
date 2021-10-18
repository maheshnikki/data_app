import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 130,
            padding: EdgeInsets.all(3),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              color: Colors.indigo.shade900,
              child: DrawerHeader(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Hi, MAhesh',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Profile & other settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ExpansionTile(
              leading: Icon(Icons.phone_iphone),
              title: Text('Mobile'),
              children: <Widget>[
                ListTile(
                    title: Center(child: Text('Recharge number')),
                    onTap: () {}),
                ListTile(
                    title: Center(child: Text('Emergency Data Loan')),
                    onTap: () {}),
                ListTile(title: Center(child: Text('My plans')), onTap: () {}),
                ListTile(title: Center(child: Text('My usage')), onTap: () {}),
                ListTile(
                    title: Center(child: Text('Recharge history')),
                    onTap: () {}),
                ListTile(
                    title: Center(child: Text('My statement')), onTap: () {}),
                ListTile(title: Center(child: Text('Vouchers')), onTap: () {}),
                ListTile(
                    title: Center(child: Text('My Coupons')), onTap: () {}),
                ListTile(title: Center(child: Text('Tunes')), onTap: () {}),
              ],
            ),
          ),
          Card(
            elevation: 5,
            child: ExpansionTile(
              leading: Icon(Icons.network_check_sharp),
              title: Text('Fiber'),
              children: <Widget>[
                ListTile(title: Center(child: Text('Get Fiber')), onTap: () {}),
                ListTile(
                    title: Center(child: Text('Refer a friend')), onTap: () {}),
                ListTile(
                    title: Center(child: Text('Recharge for a friend')),
                    onTap: () {}),
                ListTile(
                    title: Center(child: Text('Track order')), onTap: () {}),
                ListTile(
                    title: Center(child: Text('Link Fiber')), onTap: () {}),
              ],
            ),
          ),
          Card(
            elevation: 5,
            child: ExpansionTile(
              leading: Icon(Icons.shopping_cart_rounded),
              title: Text('Mart'),
              children: <Widget>[
                ListTile(
                    title: Center(child: Text('Shop by category')),
                    onTap: () {}),
                ListTile(
                    title: Center(child: Text('All offers')), onTap: () {}),
                ListTile(title: Center(child: Text('Cart')), onTap: () {}),
                ListTile(title: Center(child: Text('My orders')), onTap: () {}),
              ],
            ),
          ),
          Card(
            elevation: 5,
            child: ExpansionTile(
              leading: Icon(Icons.money),
              title: Text('UPI'),
              children: <Widget>[
                ListTile(
                    title: Center(
                      child: Text(
                        'Join us, win rewards',
                      ),
                    ),
                    onTap: () {}),
                ListTile(
                    title: Center(child: Text('Send Money')), onTap: () {}),
                ListTile(
                    title: Center(child: Text('Scan & pay')), onTap: () {}),
                ListTile(
                    title: Center(child: Text('Pay Bills, win rewards')),
                    onTap: () {}),
              ],
            ),
          ),
          Card(
            elevation: 5,
            child: ExpansionTile(
              leading: Icon(Icons.card_giftcard_rounded),
              title: Text('Play & Win'),
              children: <Widget>[
                ListTile(
                    title: Center(child: Text('Lucky Draw')), onTap: () {}),
                ListTile(title: Center(child: Text('Spin2Win')), onTap: () {}),
                ListTile(title: Center(child: Text('Fun Zone')), onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
