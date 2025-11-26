import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safar_buddy/models/travel_model.dart';
import 'package:safar_buddy/modules/db.dart';

class SearchPage extends StatefulWidget {
  final List<TravelModel> travels = travelList;

  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  @override
  Widget build(BuildContext context) {

    List<TravelModel> travelsFiltered = query == '' 
      ? [] 
      : widget.travels.where((item){
      final q = query.toLowerCase();
      return item.name!.toLowerCase().contains(q) ||
        item.location!.toLowerCase().contains(q) ||
        item.description!.toLowerCase().contains(q);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Search Bar
          searchBarField(),

          // Result List
          Expanded(
            child: travelsFiltered.isEmpty
              ? const Center(child: Text('No Result Found!'))
              : ListView.builder(
                itemCount: travelsFiltered.length,
                itemBuilder: (context, index) {
                  final item = travelsFiltered[index];
                  return searchItem(item);
                },
              )
          ),
        ],
      ),
    );
  }

  // Search Item
  ListTile searchItem(TravelModel item) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(item.image!),
      ),
      title: Text(item.name!),
      subtitle: Text(item.location!),
    );
  }

  // Search Bar
  TextField searchBarField() {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
            style: .solid
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Colors.purple.shade300,
            style: .solid
          ),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Name, Location or something related ...',
        label: Row(
          spacing: 6,
          children: [
            Icon(
              CupertinoIcons.search
            ),
            Text('Search Destinations ...'),
          ],
        ),
      ),
      onChanged: (value) {
        setState(() {
          query = value;
        });
      },
    );
  }
}