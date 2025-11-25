import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safar_buddy/models/travel_model.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {

  // ignore: prefer_final_fields
  int _selectedIndex = 0;
  double imageSize = 55;


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
            height: size.height / 2.2,
            child: Stack(
              children: [

                // Location Big Image
                mainBigImageContainer(size),

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

                // Image List View
                Positioned(
                  top: 80,
                  right: 0,
                  child: SizedBox(
                    width: 100,
                    height: (size.height / 2.2) - 95,
                    child: ListView.builder(
                      itemCount: travelList.length,
                      itemBuilder: (context, index) {
                        return imageItem(index);
                      },
                    ),
                  ),
                ),

                //
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

  // Image Item
  Widget imageItem(int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            // Change Index on-click
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            // Animated Card Box for image
            child: animatedListCardBox(index),
          ),
        ),
      ],
    );
  }

  // Image Item Animated Box
  AnimatedContainer animatedListCardBox(int index) {
    return AnimatedContainer(
      width: _selectedIndex == index ? imageSize + 20 : imageSize,
      height: _selectedIndex == index ? imageSize + 20 : imageSize,
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: _selectedIndex == index 
            ? const Color.fromARGB(255, 234, 227, 255) 
            : Colors.white
        ),
        borderRadius: _selectedIndex == index 
          ? BorderRadius.circular(18) 
          : BorderRadius.circular(14),
        image: DecorationImage(
          image: AssetImage(travelList[index].image!),
          fit: BoxFit.cover
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(
              0, // X
              5 // Y
            ),
            color: _selectedIndex == index 
              ? Colors.black.withValues(alpha: 0.2) 
              : Colors.transparent,
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
      ),
      duration: Duration(milliseconds: 250),
    );
  }

  // Main Big Image
  Positioned mainBigImageContainer(Size size) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        width: double.infinity,
        height: size.height / 2.6,
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