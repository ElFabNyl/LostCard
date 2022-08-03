import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/home_page/passport.dart';
import '../register_found_document_page/register_found_document_page.dart';
import '../reusable_widgets/customized_search_field.dart';
import '../signal_document_loss/signal_document_loss_page.dart';
import 'all.dart';
import 'cni.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 170,
              bottom: 80,
              child: SizedBox(
                width: 190,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const RegisterFoundDocumentPage()),
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                    size: 15,
                  ),
                  backgroundColor: CustomColor.primaryColor,
                  label: const Text('I found a document'),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 30,
              child: SizedBox(
                width: 190,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignalDocumentLossPage()),
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.plus,
                    size: 15,
                  ),
                  backgroundColor: const Color(0xFFB880FE),
                  label: const Text('I lost a document'),
                ),
              ),
            ),
            // Add more floating buttons if you want
            // There is no limit
          ],
        ),
        body: SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Align(
              alignment: Alignment.centerRight,
              child: CustomizedSearchField(
                width: 230,
                height: 49,
              ),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              labelColor: CustomColor.primaryColor,
              indicatorColor: CustomColor.secondaryColor,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              tabs: const [
                Tab(
                  text: 'All',
                ),
                Tab(text: 'CNI'),
                Tab(text: 'Passport'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              All(),
              Cni(),
              Passport(),
            ],
          ),
        ),
      ),
    ));
  }
}
