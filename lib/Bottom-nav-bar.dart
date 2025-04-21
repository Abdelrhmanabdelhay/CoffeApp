import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Screens/Cart-Screen.dart';
import 'package:untitled1/Screens/Notifciation-Screen.dart';
import 'package:untitled1/Screens/favourite-Screen.dart';
import 'package:untitled1/colors.dart';
import 'package:untitled1/models/FacoouriteProvider.dart';
import 'Screens/HomeScreen.dart';
import 'models/Cart-Provide.dart';
import 'models/NotficationProvider.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    FavouirtePage(),
    CartPage(),
    NotficationPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<NotificationProvider>(context, listen: false)
            .fetchDeliveredOrders());
  }

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finallist = provider.cart;
    final providerf = FavouriteProvider.of(context);
    final finallistf = providerf.cart;
    final notificationProvider = Provider.of<NotificationProvider>(context);
    final notificationCount = notificationProvider.notificationCount;
    // Calculate the total quantity
    double totalQuantity = 0;
    double totalQuantityf = 0;

    for (var item in finallist) {
      totalQuantity += item.quntity; // Assuming 'quntity' is the quantity of each item
    }

    for(var item in finallistf){
      totalQuantityf+=item.quntity;
    }
    return Scaffold(
      backgroundColor: xbackgroundColor,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: xprimaryColor,
        unselectedItemColor: xsecondaryColor,
        items: [
          _buildNavItem(Icon(Iconsax.home5), 0),
          _buildNavItem(
              Badge(
                child: Icon(Iconsax.heart),
                badgeContent: totalQuantityf > 0
                    ? Text(
                  totalQuantityf.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )
                    : null,
                showBadge:totalQuantityf>0?true:false ,
              ),
              1
          ),
          _buildNavItem(
            Badge(
              child: Icon(Iconsax.shopping_bag),
              badgeContent: totalQuantity > 0
                  ? Text(
                totalQuantity.toString(),
                style: TextStyle(color: Colors.white, fontSize: 10),
              )
                  : null,
              showBadge: totalQuantity>0?true:false,// Only show the badge content if there are items in the cart
            ),
            2,
          ),
          _buildNavItem( Badge( child: Icon(Iconsax.notification),
            badgeContent: notificationCount > 0 ?
            Text( notificationCount.toString(),
              style: TextStyle(color: Colors.white, fontSize: 10), ) : null, showBadge: notificationCount > 0?true:false
            , ), 3, )        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(Widget icon, int index) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 20,
            color: _selectedIndex == index ? xprimaryColor : Colors.transparent,
          ),
        ],
      ),
      label: '',
    );
  }

}
