import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safar_buddy/components/icon_button.dart';
import 'package:safar_buddy/modules/db.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {

  // ignore: prefer_final_fields
  int _selectedIndex = 0;
  double imageSize = 55; // For List View Thumbnails


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        // Top side With Stack
        Container(
          color: Colors.white,
          width: double.infinity,
          height: size.height / 2.2,
          child: Stack(
            children: [
    
              // Background Big Image
              mainBigImageContainer(size),
    
              // Dark Overlay For Big Image
              darkOverlayBackgroundImage(size),
    
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
    
              // Name & Location
              Positioned(
                bottom: size.height / 9,
                left: size.width / 9,
                child: nameAndLocationText(),
              ),
            ],
          ),
        ),
    
        // Description and informations
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  // Card Boxes
                  Row(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      locationDetailsCardBox(
                        context,
                        'Distance',
                        '${travelList[_selectedIndex].distance!} KM',
                      ),
                
                      locationDetailsCardBox(
                        context,
                        'Temp',
                        '${travelList[_selectedIndex].temp!}° C',
                      ),
                
                      locationDetailsCardBox(
                        context,
                        'Rating',
                        travelList[_selectedIndex].rating!,
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Description
                  Padding(
                    padding: const EdgeInsets.only(left: 36, right: 36),
                    child: Column(
                      children: [
                        // Description
                        descriptionBox(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Price
        priceBoxSection(context),
    
      ],
    );
  }

  // Price Box
  Padding priceBoxSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 36, left: 36, bottom: 12),
      child: Container(
        padding: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.grey.shade300
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            // Price
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Total Price',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '\$ ${travelList[_selectedIndex].price!.toString()}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            // Icon
            CircularIconButton(
              icon: CupertinoIcons.chevron_right,
              color: Colors.white,
              func: () {},
            ),
          ],
        ),
      ),
    );
  }

  // Description Box
  Column descriptionBox(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(
          'Description',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        
        ExpandableText(
          travelList[_selectedIndex].description!,
          expandText: 'Read More',
          collapseText: 'Show Less',
          maxLines: 1,
          linkColor: Theme.of(context).primaryColor,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }

  // Details Card Box
  Card locationDetailsCardBox(BuildContext context, String label, String variableText) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(
          width: 1,
          color: Color.fromARGB(255, 235, 235, 235),
        ),
      ),
      elevation: 0,
      child: Container(
        width: 90,
        height: 90,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: .center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.5),
                fontSize: 16,
                fontWeight: FontWeight.normal
              ),
            ),
            variableDataCardBox(
              context,
              variableText,
            ),
          ],
        ),
      ),
    );
  }

  // Variable text for card box
  Text variableDataCardBox(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Dark Overlay For Big Background Image
  Positioned darkOverlayBackgroundImage(Size size) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        width: double.infinity,
        height: size.height / 2.6,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.8),
            ],
            begin: .topCenter,
            end: .bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)
          ),
        ),
      ),
    );
  }

  // Name & Location Text
  Column nameAndLocationText() {
    return Column(
      spacing: 6,
      crossAxisAlignment: .start,
      children: [
        Text(
          travelList[_selectedIndex].name!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          spacing: 2,
          children: [
            Icon(
              CupertinoIcons.placemark_fill,
              color: Colors.white.withValues(alpha: 0.5),
            ),
            Text(
              travelList[_selectedIndex].location!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
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

  // Main Big Image For Top Background
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
          child: Icon(
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