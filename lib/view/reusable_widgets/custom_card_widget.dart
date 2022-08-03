import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatefulWidget {
  final void Function()? onPressed;
  final String imageName;
  final String address;
  final String date;
  final String documentType;
  final String ownerName;

  const CustomCard({
    Key? key,
    this.onPressed,
    required this.imageName,
    required this.address,
    required this.date,
    required this.documentType,
    required this.ownerName,
  }) : super(key: key);

  @override
  CustomCardState createState() => CustomCardState();
}

class CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed:widget.onPressed,
      child: Material(
        elevation: 5,
        child: (
        Container(

          width: 340,
          height: 123,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          decoration:  BoxDecoration(
          // //   boxShadow: <BoxShadow>[
          // //     //color: Colors.white,
          // //   BoxShadow(
          // //     color: Colors.black,
          // //     blurRadius: 1,
          // //     spreadRadius: 1,
          // //     offset: Offset(0.5, 0.5),
          // // ),
          //
          //   ],
            //border: Border.fromBorderSide(BorderSide()),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),


          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width:131 ,
                  height:123 ,
                  child: Image(
                    image: AssetImage(
                        'assets/images/' + widget.imageName),
                  ),

                ),
              ),

              const SizedBox(
                width: 10,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment:Alignment.centerLeft,
                      child: Flexible(
                        child: RichText(
                          text: TextSpan(
                              text: widget.ownerName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                              )),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),

                    Text(widget.documentType, style: const TextStyle(
                        color: Color(0xFF6B6B6B),
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                    ),),

                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: widget.address,
                            style: const TextStyle(
                                color: Color(0xFF303030),
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            )),
                        overflow: TextOverflow.clip,
                      ),
                    ),


                    const SizedBox(
                      height: 20,
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(FontAwesomeIcons.clock, size: 12,),

                          const SizedBox(
                            width: 10,
                          ),

                          Text(widget.date, style: const TextStyle(
                              color: Color(0xFF49454F),
                              fontSize: 12
                          ),)

                      ],),
                    ),




                  ],
                ),
              )


            ],

          ),
        )
        ),
      ),
    );
  }
}
