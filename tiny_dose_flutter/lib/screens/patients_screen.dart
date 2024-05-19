import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiny_dose_flutter/components/patients_list.dart';
import 'package:tiny_dose_flutter/utils/constants.dart';

class PatientsListScreen extends StatefulWidget {
  static String id = 'patients';
  const PatientsListScreen({super.key});

  @override
  State<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  List<String> items = [
    'Popescu Adelin',
    'Ionescu Marius-Adrian',
    'Amariei Georgiana',
    'Vasilescu Patricia',
    'Lucaci Simion',
    'asfbjasbfck',
    '',
    'sgs',
    'gerujher',
    'rherre',
    'ytjrt',
    'sgsg',
  ];
  List<String> filteredItems = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    searchController.addListener(() {
      filterItems();
    });
  }

  void filterItems() {
    setState(() {
      if (searchController.text.isEmpty) {
        filteredItems = items;
      } else {
        filteredItems = items
            .where((item) => item
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pacienți înregistrați',
          style: kRalewayBoldFont,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Row(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width * 0.5,
                  height: height * 0.9,
                  child: PatientsList(
                    items: filteredItems,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * 0.05,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                width: width * 0.3,
                height: height * 0.1,
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: 'Căutare după nume',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
