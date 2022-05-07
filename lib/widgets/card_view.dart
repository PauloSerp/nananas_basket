import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NCard {


  CardView({String? phase, String? description, String descriptionTwo = "", String descriptionThree = ""}) {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.deepOrangeAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(phase!,
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    textStyle: TextStyle(letterSpacing: 5),
                    fontSize: 30
                ),),
              SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.add_box_rounded, color: Colors.white,),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(description!,
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 15
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.add_box_rounded, color: Colors.white,),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(descriptionTwo,
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 15
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  descriptionThree != "" ? Row(
                    children: [
                      Icon(Icons.add_box_rounded, color: Colors.white,),
                      SizedBox(width: 10,),
                      Flexible(
                        child: Text(descriptionThree,
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 15
                          ),),
                      ),
                    ],
                  ):Container()

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
