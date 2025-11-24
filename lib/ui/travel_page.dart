import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safar_buddy/models/travel_model.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {

  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Top side
          Container(
            color: Colors.red,
            width: double.infinity,
            height: size.height / 2,
            child: Stack(
              children: [

                Container(
                  width: double.infinity,
                  height: size.height / 2.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        travelList[_selectedIndex].image!,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                    ),
                  ),
                ),

                // Appbar Icons
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: appBarIcons(),
                  ),
                ),
              ],
            ),
          ),
      
          // Description and informations
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: size.height - (size.height / 2),
          ),
      
        ],
      ),
    );
  }

  // Appbar icons
  Row appBarIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Arrow Icon
        Container(
          padding: const EdgeInsets.all(4),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.4),
            border: Border.all(
              width: 2,
              color: Colors.white
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,
          ),
        ),
    
        // Heart Icon
        Container(
          padding: const EdgeInsets.all(4),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.4),
            border: Border.all(
              width: 2,
              color: Colors.white
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            CupertinoIcons.heart,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}