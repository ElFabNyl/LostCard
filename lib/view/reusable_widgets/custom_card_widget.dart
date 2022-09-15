import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomCard extends StatefulWidget {
  final void Function()? onTap;
  final String imageName;
  final String address;
  final String date;
  final String documentType;
  final String ownerName;

  const CustomCard({
    Key? key,
    this.onTap,
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

    return GestureDetector(
      onTap: widget.onTap,
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(12),
          child: (
          Container(

            width: 340,
            height: 177,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration:  BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.circular(12)),


            child: Column(children: [
              Row(

                children: [
                  SizedBox(
                    width:130 ,
                    height:123 ,
                    child: Image.network(widget.imageName, alignment: Alignment.center,
                        errorBuilder:(context, error, stacktrace){
                      return const Icon(FontAwesomeIcons.image, size: 50,);
                        } ,
                        loadingBuilder: (context, child, loadingProgress){
                          if(loadingProgress==null){
                            return child;
                          }
                          return const Center(child: Text('Loading...'),);


                        }
                    ),

                  ),


                  const SizedBox(
                    width: 10,
                  ),

                  SizedBox(
                    width: 140,
                    child: Column(
                      children: [
                        Align(
                          alignment:Alignment.centerLeft,
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

                        const SizedBox(
                          height: 2,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.documentType, style: const TextStyle(
                              color: Color(0xFF6B6B6B),
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),),
                        ),

                        const SizedBox(
                          height: 2,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                text: widget.address,
                                style: const TextStyle(
                                    color: Color(0xFF303030),
                                    fontSize: 12
                                )),
                            overflow: TextOverflow.clip,
                          ),

                        ),

                        const SizedBox(
                          height: 2,
                        ),


                        const SizedBox(
                          height: 10,
                        ),







                      ],
                    ),
                  )


                ],

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(FontAwesomeIcons.clock, size: 12,),

                  const SizedBox(
                    width: 10,
                  ),

                  Text(widget.date, style: const TextStyle(
                      color: Color(0xFF49454F),
                      fontSize: 12
                  ),),

                  const SizedBox(width:20),

                ],),


            ],),




          )
          ),
        ),
    );
  }
}
