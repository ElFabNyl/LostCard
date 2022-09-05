import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/controllers/document_controller.dart';
import 'package:lostcard/view/home_page/passport.dart';
import 'package:lostcard/view/reusable_widgets/floating_acion_button_container.dart';
import '../../model/document_model.dart';
import '../found_lost_document_page/found_lost_document_page.dart';
import '../reusable_widgets/custom_card_widget.dart';
import '../reusable_widgets/customized_search_field.dart';
import 'all.dart';
import 'cni.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  QuerySnapshot? foundDocuments;

  TextEditingController searchController = TextEditingController();


  String searchValue = '';

  bool isNotClicked = true;

  bool isTapped = true;

  bool isDocumentsFound = true;

  bool isPassportsFound = true;

  bool isCniFound = true;



  List<Widget> anotherList = [];







  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    DocumentController().getAllDocuments().then((results) {

      setState(() {
        foundDocuments = results;
      });
    },

    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cniList = [];

    List<Widget> passportList = [];
    List<Widget> generalList = [];
    var i = 0;

    //LoadingIndicator(context).startLoading();
    if (!(foundDocuments == null)) {
      //LoadingIndicator(context).stopLoading();



      while (i < foundDocuments!.docs.length) {
        var images = DocumentModel.fromJson(
                foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .listOfFiles;
        var address = DocumentModel.fromJson(
                foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .address;
        var date = DocumentModel.fromJson(
                foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .registrationDate;
        var documentType = DocumentModel.fromJson(
                foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .documentType;
        var ownerName = DocumentModel.fromJson(
                foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .name;

        var idDocument = DocumentModel.fromJson(
                foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .idDocument;

        var documentState = DocumentModel.fromJson(
                foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .documentState;


        generalList.add(CustomCard(
          imageName: images[0],
          address: address,
          date: date,
          documentType: documentType,
          ownerName: ownerName,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoundLostDocumentPage(
                        ownerName: ownerName,
                        address: address,
                        date: date,
                        documentState: documentState,
                        documentType: documentType,
                        imageList: images,
                        idDocument: idDocument,
                      )),
            );
          },
        ));

        if(DocumentModel.fromJson(
            foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .documentType.compareTo('CNI')==0){
          cniList.add(CustomCard(
            imageName: images[0],
            address: address,
            date: date,
            documentType: documentType,
            ownerName: ownerName,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoundLostDocumentPage(
                      ownerName: ownerName,
                      address: address,
                      date: date,
                      documentState: documentState,
                      documentType: documentType,
                      imageList: images,
                      idDocument: idDocument,
                    )),
              );
            },
          ));

          isCniFound = false;

        }


        if(DocumentModel.fromJson(
            foundDocuments!.docs[i].data() as Map<String, dynamic>)
            .documentType.compareTo('Passport')==0){
          passportList.add(CustomCard(
            imageName: images[0],
            address: address,
            date: date,
            documentType: documentType,
            ownerName: ownerName,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FoundLostDocumentPage(
                      ownerName: ownerName,
                      address: address,
                      date: date,
                      documentState: documentState,
                      documentType: documentType,
                      imageList: images,
                      idDocument: idDocument,
                    )),
              );
            },
          ));

          isPassportsFound = false;

        }

        i++;
      }

    }
    else{
      isDocumentsFound = false;
    }





    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton.large(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const FloatingActionButtonContainer();
                  });
            },
            child: const Icon(
              FontAwesomeIcons.plus,
              size: 15,
            ),
            backgroundColor: CustomColor.primaryColor,
          ),
        ),
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                    toolbarHeight: 77,
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: CustomizedSearchField(
                          controller: searchController,
                          width: 230,
                          height: 49,
                          onPressed: (){
                            setState(() {


                              isTapped = true;
                              searchController.clear();


                            });
                          },
                          onChanged: (value) {
                            searchValue = value;

                            print('Here is search value ' +searchValue);

                            List<Widget> searchList = [];
                            anotherList = [];


                                int count = 0;
                                if(!(searchValue.isEmpty)){
                                  while(count < foundDocuments!.docs.length){
                                    if (DocumentModel.fromJson(
                                        foundDocuments!.docs[count].data()
                                        as Map<String, dynamic>)
                                        .name
                                        .toLowerCase()
                                        .contains(searchValue)) {
                                      print('true, true, true');
                                      var images = DocumentModel.fromJson(
                                          foundDocuments!.docs[count].data() as Map<String, dynamic>)
                                          .listOfFiles;
                                      var address = DocumentModel.fromJson(
                                          foundDocuments!.docs[count].data()
                                          as Map<String, dynamic>)
                                          .address;
                                      var date = DocumentModel.fromJson(
                                          foundDocuments!.docs[count].data()
                                          as Map<String, dynamic>)
                                          .registrationDate;
                                      var documentType = DocumentModel.fromJson(
                                          foundDocuments!.docs[count].data()
                                          as Map<String, dynamic>)
                                          .documentType;
                                      var ownerName = DocumentModel.fromJson(
                                          foundDocuments!.docs[count].data()
                                          as Map<String, dynamic>)
                                          .name;

                                      var idDocument = DocumentModel.fromJson(
                                          foundDocuments!.docs[count].data()
                                          as Map<String, dynamic>)
                                          .idDocument;

                                      var documentState = DocumentModel.fromJson(
                                          foundDocuments!.docs[count].data()
                                          as Map<String, dynamic>)
                                          .documentState;

                                      searchList.add(CustomCard(
                                        imageName: images[0],
                                        address: address,
                                        date: date,
                                        documentType: documentType,
                                        ownerName: ownerName,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    FoundLostDocumentPage(
                                                      ownerName: ownerName,
                                                      address: address,
                                                      date: date,
                                                      documentState: documentState,
                                                      documentType: documentType,
                                                      imageList: images,
                                                      idDocument: idDocument,
                                                    )),
                                          );
                                        },
                                      ));

                                    }


                                    count++;
                                  }

                                  setState(() {
                                    print('Search list number of items is:'+ searchList.length.toString());

                                    print('Search list number of items is before:'+ generalList.length.toString());

                                    anotherList = searchList;


                                    isTapped = false;



                                    print('Generalist list number of items is:'+ generalList.length.toString());

                                    print('//isNotClicked = true;');
                                  });

                                }
                                else{
                                  setState(() {


                                    isTapped = true;




                                  });
                                }




                          }),
                    ),
                    backgroundColor: Colors.white,
                    bottom: isTapped?TabBar(
                            labelColor: CustomColor.primaryColor,
                            indicatorColor: CustomColor.secondaryColor,
                            labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                            tabs: const [
                              Tab(
                                text: 'All',
                              ),
                              Tab(text: 'CNI'),
                              Tab(text: 'Passport'),
                            ],
                          ):const PreferredSize(child: Align(alignment: Alignment.centerLeft, child:Text('       Search results...', textAlign: TextAlign.center,)), preferredSize: Size.fromHeight(40.0))
                        ),
                body: isTapped?TabBarView(
                  children: [
                    All(list: generalList,isDocumentsFound: isDocumentsFound),
                    Cni(
                      list: cniList,isCniFound: isCniFound,
                    ),
                    Passport(
                      list: passportList,isPassportsFound: isPassportsFound,
                    ),
                  ],
                ):All(list: anotherList,isDocumentsFound: isDocumentsFound,)),
          ),
        ));
  }
}
