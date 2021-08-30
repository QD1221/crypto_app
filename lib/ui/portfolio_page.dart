import 'dart:convert';

import 'package:crypto_app/model/crypto_asset.dart';
import 'package:crypto_app/model/my_assets.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  late MyAsset _myAsset;
  late CryptoAsset _cryptoAsset;

  @override
  void initState() {
    super.initState();

    _myAsset = MyAsset.fromJson(jsonDecode(kCryptoMyAsset));
    _cryptoAsset = CryptoAsset.fromJson(jsonDecode(kCryptoAsset));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Portfolio',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$23,874.45',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Portfolio balance',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  FloatingActionButton(
                    mini: true,
                    child: Icon(Icons.arrow_forward),
                    backgroundColor: Colors.white,
                    elevation: 3,
                    foregroundColor: Colors.black,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s Results',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$ 23,874.45',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Estimated Profit',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$ 34.45',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Realized Profit',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '\$ 4,553.55',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'My Assets',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: _myAsset.myAssets!.map((e) => Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Card(
                            elevation: 4,
                            child: Center(
                              child: CircleAvatar(
                                radius: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${e.coin}',
                                style:
                                TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text('${e.unit}'),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              'USD ${e.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: e
                                      .change?.upDown ==
                                      'up'
                                      ? Colors.green
                                      : Colors.red,
                                  foregroundColor: Colors.white,
                                  child: e.change
                                      ?.upDown ==
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
                                  '${e.change?.upDown == 'up' ? '+' : '-'}'
                                      '${e.change?.rate}%',
                                  style: TextStyle(
                                    color: e.change
                                        ?.upDown ==
                                        'up'
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )).toList(),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Crypto Assets',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: _cryptoAsset.cryptoAssets?.length ?? 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 64,
                              width: 64,
                              child: Card(
                                elevation: 4,
                                child: Center(
                                  child: CircleAvatar(
                                    radius: 16,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_cryptoAsset.cryptoAssets?[index].coin}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      '${_cryptoAsset.cryptoAssets?[index].unit}'),
                                ],
                              ),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  'USD ${_cryptoAsset.cryptoAssets?[index].price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: _cryptoAsset
                                                  .cryptoAssets?[index]
                                                  .change
                                                  ?.upDown ==
                                              'up'
                                          ? Colors.green
                                          : Colors.red,
                                      foregroundColor: Colors.white,
                                      child: _cryptoAsset.cryptoAssets?[index]
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
                                      '${_cryptoAsset.cryptoAssets?[index].change?.upDown == 'up' ? '+' : '-'}'
                                      '${_cryptoAsset.cryptoAssets?[index].change?.rate}%',
                                      style: TextStyle(
                                        color: _cryptoAsset.cryptoAssets?[index]
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
                            )
                          ],
                        ),
                      );
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
