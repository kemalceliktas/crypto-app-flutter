import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_first_crypto_app/authfirebase/flutterfire.dart';
import 'package:my_first_crypto_app/globalconst/global_const.dart';
import 'package:my_first_crypto_app/pages/home_view.dart';
import 'package:my_first_crypto_app/widgets/components/portfolio_card.dart';
import 'package:my_first_crypto_app/widgets/porfolio_all.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = [
    "bitcoin",
    "tether",
    "ethereum",
    "dogecoin",
    "europecoin"
  ];

  String dropdownValue = "bitcoin";
  TextEditingController _searchController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 33, 36),
      appBar: AppBar(
        title: Text(
          "Add new Coin",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.logout_sharp))
        ],
        backgroundColor: Color.fromARGB(255, 25, 33, 36),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(45.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: DropdownButtonHideUnderline(
                  child: Container(
                    child: DropdownButton2(
                      buttonPadding:
                          EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      isExpanded: true,
                      buttonDecoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                          border: Border.all(
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(15)),
                      buttonHighlightColor: Colors.white,
                      items: coins
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: dropdownValue,
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value as String;
                        });
                      },
                      buttonHeight: 40,
                      buttonWidth: 200,
                      itemHeight: 40,
                      dropdownMaxHeight: 200,
                      searchController: _searchController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return (item.value.toString().contains(searchValue));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          _searchController.clear();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          //TEXT FİELD
          Container(
            padding: EdgeInsets.only(bottom: 12),
            width: MediaQuery.of(context).size.width / 1.4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _amountController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Amount is here...",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          //ADD BUTTON
          Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              
            ),
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.amber[800],
              ),
              child: TextButton(
                  onPressed: () async {
                    await addCoin(dropdownValue, _amountController.text);

                    setState(() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomeView()));
                    });
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.black87),
                  )),
            ),
          ),
          SizedBox(height: PageSize.height20*2,),
          Text("Recently Added",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: PageSize.height20*2,),
          Portfolio(),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(color: Colors.black),
        ),
      );
}
