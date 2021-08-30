import 'package:crypto_app/ui/balance_page.dart';
import 'package:crypto_app/ui/portfolio_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ValueNotifier<int> _tabIndex = ValueNotifier(0);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<int>(
            valueListenable: _tabIndex,
            builder: (context, value, child) {
              if (value == 0) {
                return BalancePage();
              } else if (value == 1) {
                return PortfolioPage();
              }
              return Container();
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 72,
          child: ValueListenableBuilder<int>(
            valueListenable: _tabIndex,
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      _tabIndex.value = 0;
                    },
                    icon: value == 0
                        ? Icon(
                            Icons.home,
                            color: Colors.indigo,
                          )
                        : Icon(
                            Icons.home_outlined,
                            color: Colors.grey,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      _tabIndex.value = 1;
                    },
                    icon: value == 1
                        ? Icon(
                            Icons.pie_chart,
                            color: Colors.indigo,
                          )
                        : Icon(
                            Icons.pie_chart_outline_outlined,
                            color: Colors.grey,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      _tabIndex.value = 2;
                    },
                    icon: value == 2
                        ? Icon(
                            Icons.account_balance_wallet,
                            color: Colors.indigo,
                          )
                        : Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Colors.grey,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      _tabIndex.value = 3;
                    },
                    icon: value == 3
                        ? Icon(
                            Icons.person,
                            color: Colors.indigo,
                          )
                        : Icon(
                            Icons.person_outline,
                            color: Colors.grey,
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
