import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nananas_basket/widgets/card_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Uri _openSeaUrl = Uri.parse("https://opensea.io/collection/nananas-basket");
  final Uri _instagramUrl = Uri.parse("https://www.instagram.com/digg.odi");
  final String fristText = "In an universe where Bananas evolved and";
  final String secondText = "the humanity does not exist";
  final String thirdText = "what is your NANANÁ?";

  double width = 0;

  final _nCard = NCard();

  var number1 = 0,
      number2 = 0,
      number3 = 0,
      number4 = 0,
      number5 = 0;

  bool _loading = true;
  bool _isShort = false;

  @override
  void initState() {

    selectRandom();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.3);
    return _loading ?
      LayoutBuilder(
        builder: (context, constraints){
          _isShort = constraints.maxWidth < 1150;
      if(_isShort){
        return _shortLayout();
      }else{
        return _largeLayout();
      }
    }): CircularProgressIndicator(color: Colors.orangeAccent,);
  }

  selectRandom(){
    number1 = Random().nextInt(15);
    do{
      number2 = Random().nextInt(15);
    }while(number1 == number2);
    do{
      number3 = Random().nextInt(15);
    }while(number1 == number3 || number2 == number3);
    do{
      number4 = Random().nextInt(15);
    }while(number1 == number4 || number2 == number4 || number3 == number4);
    do{
      number5 = Random().nextInt(15);
    }while(number1 == number5 || number2 == number5 || number3 == number5 || number4 == number5);
  }

  _largeLayout(){
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                  pinned: true,
                  snap: false,
                  floating: false,
                  expandedHeight: 500.0,
                  collapsedHeight: 130,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Nananas Basket",
                        style: GoogleFonts.bangers(
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                            color: Colors.white
                        )),
                    background: Image.asset("assets/images/planet.png", fit: BoxFit.cover,),)
              ),
              SliverList(delegate: SliverChildListDelegate([
                _bodyLarge(),
                _bottonBar()
              ]))
            ],
          )
      ),
    );
  }

  _shortLayout(){
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                  pinned: false,
                  snap: false,
                  floating: false,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text("Nananas Basket",
                        style: GoogleFonts.bangers(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white
                        )),
                    background: Image.asset("assets/images/planet.png", fit: BoxFit.cover,),)
              ),
              SliverList(delegate: SliverChildListDelegate([
                _bodyShort(),
                _bottonBar()
              ]))
            ],
          )
      ),
    );
  }

  //_body(),
  _bottomAppBar(){
    return BottomAppBar(
      color: Colors.brown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: ()=>_launchUrl(_instagramUrl), icon: const Icon(FontAwesomeIcons.instagram, size: 30,),color: Colors.white,),
          IconButton(onPressed: ()=>_launchUrl(_openSeaUrl), icon: const ImageIcon(AssetImage("assets/images/openseaIcon.png")),iconSize: 40,color: Colors.white,)
        ],
      ),
    );
  }

  _bottonBar(){
    return Column(children: [
      Container(
      height: width * 0.2,
      child: _bottomAppBar(),
    ),
      Container(
        height: 30,
        color: Colors.brown[800],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Text("Diggodi", style: GoogleFonts.bangers(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent
        )),
        ],),)
    ],);
  }

  _bodyLarge(){
    return Container(
      color: Colors.yellow[700],
      child: Center(
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          color: Colors.yellow[700],
          child: Wrap(
            direction: Axis.horizontal,
            spacing: 8.0,
            runSpacing: 4.0,
                 children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          "assets/images/image$number1.png",
                          width: width * 0.5,
                          height: width * 0.5,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 30,),
                      Expanded(
                        child: Center(
                          child: Text("$fristText \n $secondText",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                              textStyle: TextStyle(letterSpacing: 5),
                              fontSize: 50
                            ),),
                        ),
                      )
                    ],
                  ),


                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(thirdText,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.bebasNeue(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                textStyle: TextStyle(letterSpacing: 5),
                                fontSize: 50
                            ),),
                        ),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        width: width * 0.4,
                        height: width * 0.4,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: GridView.count(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              children: [

                                Image.asset(
                                  "assets/images/image$number2.png",
                                  fit: BoxFit.fill,
                                ),
                                Image.asset(
                                  "assets/images/image$number3.png",
                                  fit: BoxFit.fill,
                                ),
                                Image.asset(
                                  "assets/images/image$number4.png",
                                  fit: BoxFit.fill,
                                ),
                                Image.asset(
                                  "assets/images/image$number5.png",
                                  fit: BoxFit.fill,
                                ),
                              ],
                          ),
                        ),
                      ),

                    ],
                  ),
                   Divider(height: 100,),

                   Center(
                     child: RichText(
                       text: TextSpan(
                         children: [
                           TextSpan(
                               text: "NANANAS BASKET ",
                               style: GoogleFonts.bangers(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 50,
                                   color: Colors.white
                       )),
                           TextSpan(
                               text: "is a banana project from another reality where all the characters are handmade and unique, you can find us on ",
                               style: GoogleFonts.bebasNeue(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  textStyle: TextStyle(letterSpacing: 5),
                                  fontSize: 25
                             ),),
                           TextSpan(text: "OpenSea",
                             recognizer: TapGestureRecognizer()..onTap = ()=>_launchUrl(_openSeaUrl),
                             style: GoogleFonts.bebasNeue(
                                 fontWeight: FontWeight.bold,
                                 color: Colors.blueAccent,
                                 textStyle: TextStyle(letterSpacing: 5),
                                 fontSize: 25
                             ),),
                         ]
                       ),
                     )
                   ),
                   Divider(height: 100,),
                   SizedBox(height: 30,),
                   Column(
                     children: [
                       Text("ROADMAP",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.bebasNeue(
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             textStyle: TextStyle(letterSpacing: 5),
                             fontSize: 50
                         ),),
                       SizedBox(height: 30,),

                       _roadmap(),
                     ],
                   ),
                ],
              )
        ),
      ),
    );
  }

  _bodyShort(){
    return Container(
      color: Colors.yellow[700],
      child: Center(
        child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.yellow[700],
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      "assets/images/image$number1.png",
                      width: width * 0.5,
                      height: width * 0.5,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                Center(
                  child: Text("$fristText \n $secondText",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        textStyle: TextStyle(letterSpacing: 5),
                    ),),
                ),
                SizedBox(height: 100,),
                Center(
                  child: Container(
                    width: width * 0.4,
                    height: width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: GridView.count(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        children: [

                          Image.asset(
                            "assets/images/image$number2.png",
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            "assets/images/image$number3.png",
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            "assets/images/image$number4.png",
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            "assets/images/image$number5.png",
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                Center(
                  child: Text(thirdText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                        textStyle: TextStyle(letterSpacing: 5),
                        fontSize: 50
                    ),),
                ),
                Divider(height: 100,),
                Center(
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: "NANANAS BASKET ",
                                style: GoogleFonts.bangers(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    color: Colors.white
                                )),
                            TextSpan(
                              text: "is a banana project from another reality where all the characters are handmade and unique, you can find us on ",
                              style: GoogleFonts.bebasNeue(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown,
                                  textStyle: TextStyle(letterSpacing: 5),
                                  fontSize: 25
                              ),),
                            TextSpan(text: "OpenSea",
                              recognizer: TapGestureRecognizer()..onTap = ()=>_launchUrl(_openSeaUrl),
                              style: GoogleFonts.bebasNeue(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent,
                                  textStyle: TextStyle(letterSpacing: 5),
                                  fontSize: 25
                              ),),
                          ]
                      ),
                    )
                ),
                Divider(height: 100,),
                Column(
                  children: [
                    Text("ROADMAP",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          textStyle: TextStyle(letterSpacing: 5),
                          fontSize: 50
                      ),),
                    SizedBox(height: 30,),
                    _roadmap(),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  _roadmap(){
    return
      Center(
        child: Container(
          width: 600,
          height: 600,
          child: !_isShort ? Column(
          children: [
             Row(
              children: [
                _nCard.CardView(
                phase: 'Phase 1',
                description: 'Mint price: 0.004 - 0.0045',
                descriptionTwo: '50 item : 5 pirates, 2 zombies, 1 alien',
              ),
                _nCard.CardView(
                    phase: 'Phase 2',
                    description: 'Mint price: 0.0045 - 0.005',
                    descriptionTwo: '25 item : 2 pirates, 2 zombies, 1 alien',
                    descriptionThree: 'will include gender female'),],
            ),



            _nCard.CardView(
                phase: 'Phase 3',
                description: 'Mint price: 0.004 - 0.0045',
                descriptionTwo: '50 item : 5 pirates, 2 zombies, 1 alien',
                descriptionThree: 'will include animated nananás')
          ],
          ): Container(
            child: Column(
              children: [
                _nCard.CardView(
                  phase: 'Phase 1',
                  description: 'Mint price: 0.004 - 0.0045',
                  descriptionTwo: '50 item : 5 pirates, 2 zombies, 1 alien',
                ),
                _nCard.CardView(
                    phase: 'Phase 2',
                    description: 'Mint price: 0.0045 - 0.005',
                    descriptionTwo: '25 item : 2 pirates, 2 zombies, 1 alien',
                    descriptionThree: 'will include gender female'),

                _nCard.CardView(
                    phase: 'Phase 3',
                    description: 'Mint price: 0.004 - 0.0045',
                    descriptionTwo: '50 item : 5 pirates, 2 zombies, 1 alien',
                    descriptionThree: 'will include animated nananás')

              ],
            ),
          )
        ),
      );
  }

  _launchUrl(Uri url) async{
    if(!await launchUrl(url))throw 'Could not launch $url';
  }
}


