import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_with_provider/providers/app_provider.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProviderRepo(),
      child: Consumer<AppProviderRepo>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: const Text('App Layout'),
          ),
          body: value.pages[value.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: '',
              ),
            ],
            onTap: (index) {
              value.changePage(index);
            },
            currentIndex: value.currentIndex,
          ),
        ),
      ),
    );
  }
}
