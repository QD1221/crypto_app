import 'dart:convert';

import 'package:crypto_app/model/my_assets.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ValueNotifier<int> _tabIndex = ValueNotifier(0);

  late MyAsset _myAsset;

  @override
  void initState() {
    super.initState();

    _myAsset = MyAsset.fromJson(jsonDecode(kCryptoMyAsset));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications_outlined),
                        ),
                      ],
                    ),
                    Text(
                      '\$ ${_myAsset.balance}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          child: Text(
                            'This Week',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '+ ${_myAsset.thisWeek}% ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(24)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Top Up',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'My Assets',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _myAsset.myAssets!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 12,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${_myAsset.myAssets?[index].coin}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4,),
                                    Text('${_myAsset.myAssets?[index].unit}'),
                                    Text(
                                      'USD ${_myAsset.myAssets?[index].price}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4,),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 8,
                                          backgroundColor: _myAsset
                                                      .myAssets?[index]
                                                      .change
                                                      ?.upDown ==
                                                  'up'
                                              ? Colors.green
                                              : Colors.red,
                                          foregroundColor: Colors.white,
                                          child: _myAsset.myAssets?[index]
                                                      .change?.upDown ==
                                                  'up'
                                              ? Icon(
                                                  Icons.arrow_upward,
                                                  size: 8,
                                                )
                                              : Icon(
                                                  Icons.arrow_downward,
                                                  size: 8,
                                                ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${_myAsset.myAssets?[index].change?.upDown == 'up' ? '+' : '-'}'
                                          '${_myAsset.myAssets?[index].change?.rate}%',
                                          style: TextStyle(
                                            color: _myAsset.myAssets?[index]
                                                        .change?.upDown ==
                                                    'up'
                                                ? Colors.green
                                                : Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Placeholder(),
            ),
          ],
        ),
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
