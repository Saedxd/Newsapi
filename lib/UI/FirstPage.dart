import 'package:flutter/material.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import "package:newsapii/AdsManager.dart";
import 'package:newsapii/UI/homepage.dart';
import 'package:newsapii/Data/News_Manager/api_manager.dart';
class Home extends StatefulWidget {
  String Country = '';
  String category = '';
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  final instance = API_Manager();
  final instance2 = HomePage();
  final Adsinstance = AdsManager();
  BannerAd _BannerAd1;
  BannerAd _BannerAd2;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isBackPressedOrTouchedOutSide = false,
      _isDropDownOpened = false,
      _isPanDown = false;
  bool _isBackPressedOrTouchedOutSide2 = false,
      _isPanDown2 = false;


  List<String> itemS = [
    "Slovenia",
  "Slovakia",
  "Thailand",
  "Turkey",
  "Taiwan",
  "Ukraine",
  "United States of America",
  "Venezuela",
  "Tanzania",
  "Japan",
  "South Korea",
  "Lithuania",
  "Latvia",
  "Morocco",
  "Mexico",
  "Malaysia",
  "Nigeria",
  "Netherlands",
  "Norway",
  "New Zealand",
  "Philippines",
  "Poland",
  "Portugal",
  "Romania",
  "Serbia",
  "Russian Federation",
  "Saudi Arabia",
  "Sweden",
  "Singapore",
  "United Arab Emirates",
  "Argentina",
  "Austria",
  "Australia",
  "Belgium",
  "Bulgaria",
  "Brazil",
  "Canada",
  "Switzerland",
  "China",
 "Colombia",
  "Cuba",
  "Czech rep",
  "Federal Republic of Germany",
  "Egypt",
  "France",
  "United Kingdom",
  "Greece",
  "Hong Kong",
  "Hungary",
  "Indonesia",
  "reland",
  "Israel",
  "India",
  "Italy",
  ];
  List<String> itemS2 = [ "business","entertainment","general", "health",  "science" ,"sports", "technology" ];



  String _selectedItem = '';
  String _selectedItem2 = '';


  @override
  void initState() {
   // _list = ["Abc", "DEF", "GHI", "JKL", "MNO", "PQR"];
    _selectedItem = 'Select Country';
    _selectedItem2 = 'Select category';
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    instance.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    /// we need to wrap our Scaffold in GestureDetector in order to get required functionalities
    ///  i.e. close the dropdown on drawer click and touch on outside
    return GestureDetector(
      onTap: _removeFocus,
      onPanDown: (focus) {
        _isPanDown = true;
        _removeFocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFF2D2C3C),
        key: _scaffoldKey,

        /// I have maintain open and close state of drop down with the drawer
        /// if drop down is opened and user wants to open Drawer, it will first close the drop down then open the drawer

        appBar:AppBar(
          backgroundColor: Color(0xFF2D2C3C),
          elevation: 0,
          centerTitle: true,
          title: Text("Live News",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 28,
            fontWeight: FontWeight.bold

          ),

          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 15, left: 16, right: 20),
                    child: AwesomeDropDown(
                      isPanDown: _isPanDown,
                      dropDownList: itemS,
                      isBackPressedOrTouchedOutSide: _isBackPressedOrTouchedOutSide,
                      selectedItem: _selectedItem,
                      numOfListItemToShow: 30,
                      selectedItemTextStyle: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),
                      dropDownListTextStyle: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),

                      onDropDownItemClick: (selectedItem) async{
                        widget.Country = await selectedItem;
                        switch(selectedItem){

                          case "Slovenia":instance.CuntrySink.add("si");
                          break;
                          case  "Slovakia":instance.CuntrySink.add("sk");
                          break;
                          case  "Thailand":instance.CuntrySink.add("th");
                          break;
                          case  "Turkey":instance.CuntrySink.add("tr");
                          break;
                          case  "Taiwan":instance.CuntrySink.add("tw");
                          break;
                          case  "Ukraine":instance.CuntrySink.add("ua");
                          break;
                          case  "United States of America":instance.CuntrySink.add("us");
                          break;
                          case  "Venezuela":instance.CuntrySink.add("ve");
                          break;
                          case  "Tanzania":instance.CuntrySink.add("za");
                          break;
                          case  "Japan":instance.CuntrySink.add("jp");
                          break;
                          case  "South Korea":instance.CuntrySink.add("kr");
                          break;
                          case  "Lithuania":instance.CuntrySink.add("lt");
                          break;
                          case  "Latvia":instance.CuntrySink.add("lv");
                          break;
                          case  "Morocco":instance.CuntrySink.add("ma");
                          break;
                          case  "Mexico":instance.CuntrySink.add("mx");
                          break;
                          case  "Malaysia":instance.CuntrySink.add("my");
                          break;
                          case  "Nigeria":instance.CuntrySink.add("ng");
                          break;
                          case "Netherlands":instance.CuntrySink.add("nl");
                          break;
                          case  "Norway":instance.CuntrySink.add("no");
                          break;
                          case  "New Zealand":instance.CuntrySink.add("nz");
                          break;
                          case "Philippines":instance.CuntrySink.add("ph");
                          break;
                          case  "Poland":instance.CuntrySink.add("pl");
                          break;
                          case  "Portugal":instance.CuntrySink.add("pt");
                          break;
                          case  "Romania":instance.CuntrySink.add("ro");
                          break;
                          case  "Serbia":instance.CuntrySink.add("rs");
                          break;
                          case "Russian Federation":instance.CuntrySink.add("ru");
                          break;
                          case "Saudi Arabia":instance.CuntrySink.add("sa");
                          break;
                          case  "Sweden":instance.CuntrySink.add("se");
                          break;
                          case  "Singapore":instance.CuntrySink.add("sg");
                          break;
                          case  "United Arab Emirates":instance.CuntrySink.add("ae");
                          break;
                          case  "Argentina":instance.CuntrySink.add("ar");
                          break;
                          case "Austria":instance.CuntrySink.add("at");
                          break;
                          case "Australia":instance.CuntrySink.add("au");
                          break;
                          case  "Belgium":instance.CuntrySink.add("be");
                          break;
                          case  "Bulgaria":instance.CuntrySink.add("bg");
                          break;
                          case  "Brazil":instance.CuntrySink.add("br");
                          break;
                          case  "Canada":instance.CuntrySink.add("ca");
                          break;
                          case  "Switzerland":instance.CuntrySink.add("ch");
                          break;
                          case  "China":instance.CuntrySink.add("cn");
                          break;
                          case  "Colombia":instance.CuntrySink.add("co");
                          break;
                          case  "Cuba":instance.CuntrySink.add("cu");
                          break;
                          case  "Czech rep":instance.CuntrySink.add("cz");
                          break;
                          case  "Federal Republic of Germany":instance.CuntrySink.add("de");
                          break;
                          case  "Egypt":instance.CuntrySink.add("eg");
                          break;
                          case "France":instance.CuntrySink.add("fr");
                          break;
                          case  "United Kingdom":instance.CuntrySink.add("gb");
                          break;
                          case  "Greece":instance.CuntrySink.add("gr");
                          break;
                          case  "Hong Kong":instance.CuntrySink.add("hk");
                          break;
                          case  "Hungary":instance.CuntrySink.add("hu");
                          break;
                          case  "Indonesia":instance.CuntrySink.add("id");
                          break;
                          case  "reland":instance.CuntrySink.add("ie");
                          break;
                          case "Israel":instance.CuntrySink.add("il");
                          break;
                          case "India":instance.CuntrySink.add("in");
                          break;
                          case  "Italy":instance.CuntrySink.add("it");
                          break;


                        }

                        //   widget.value =selectedItem.toString();

                        //  instance.CuntrySink.add(selectedItem);
                        // await Getit();


                        // Future.delayed(const Duration(milliseconds: 3000), () async{

                        //  });




                        _selectedItem = selectedItem;
                      },
                      dropStateChanged: (isOpened) {
                        _isDropDownOpened = isOpened;
                        if (!isOpened) {
                          _isBackPressedOrTouchedOutSide = false;
                        }
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 15, left: 16, right: 20),
                    child: AwesomeDropDown(

                      isPanDown: _isPanDown2,
                      dropDownList: itemS2,

                      isBackPressedOrTouchedOutSide: _isBackPressedOrTouchedOutSide2,
                      selectedItem: _selectedItem2,
                     // numOfListItemToShow: 30,
                      selectedItemTextStyle: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),
                      dropDownListTextStyle: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      ),

                      onDropDownItemClick: (selectedItem) async{
                        widget.category =  await selectedItem;
                        instance.CATsink.add(selectedItem);
                        // switch(selectedItem){
                        //
                        //   case "business":
                        //   break;
                        //   case  "entertainment":instance.CATsink.add(selectedItem);
                        //   break;
                        //   case  "general":instance.CATsink.add(selectedItem);
                        //   break;
                        //   case  "health":instance.CATsink.add(selectedItem);
                        //   break;
                        //   case  "science":instance.CATsink.add(selectedItem);
                        //   break;
                        //   case  "sports":instance.CATsink.add(selectedItem);
                        //   break;
                        //   case  "technology":instance.CATsink.add(selectedItem);
                        //   break;
                        //
                        //
                        //
                        // }


                        _selectedItem = selectedItem;
                      },
                      dropStateChanged: (isOpened2) {
                        _isDropDownOpened = isOpened2;
                        if (!isOpened2) {
                          _isBackPressedOrTouchedOutSide2 = false;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                  Navigator.push(context,
                     MaterialPageRoute(builder: (context) =>  HomePage()),
                   );

              },
              child: Container(
                width: w/1.3,
                height: h/11,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(33.0),
                 // border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink,
                      offset: Offset(0, 1),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Text("Let's see whats new!",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),


                ),
              ),
            ),
         Container(
           child: Column(
             children: [
               Adsinstance.getbanner( "ca-app-pub-3237644024612902/7316624330",_BannerAd1, false),
               Adsinstance.getbanner( "ca-app-pub-3237644024612902/7565967975",_BannerAd2, false),
             ],
           ),
         ),


          ],
        ),
      ),
    );
  }

  /// this func is used to close dropDown (if open) when you tap or pandown anywhere in the screen
  void _removeFocus() {
    if (_isDropDownOpened) {
      setState(() {
        _isBackPressedOrTouchedOutSide = true;
        _isBackPressedOrTouchedOutSide2= true;
      });
    }
  }

  /// this func will call on DrawerIconPressed, it closes the dropDown if open and then open the drawer
  void _onDrawerBtnPressed() {
    if (_isDropDownOpened) {
      setState(() {
        _isBackPressedOrTouchedOutSide = true;
        _isBackPressedOrTouchedOutSide2 = true;
      });
    }
    else {
      _scaffoldKey.currentState.openEndDrawer();
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
// bottomNavigationBar: showAd(),

// PreferredSize(
//   preferredSize: AppBar().preferredSize,
//   child: SafeArea(
//     child: PreferredSize(
//         preferredSize: Size.fromHeight(100.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 60),
//               child: Text('Live NEWS',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold)),
//             ),
//             Container(
//                 margin: EdgeInsets.only(right: 8),
//                 child: IconButton(
//                     icon: Icon(
//                       Icons.menu,
//                       size: 30,
//                       color: Colors.blueAccent,
//                     ),
//                     onPressed: () {
//                       _onDrawerBtnPressed();
//                     } //_onDrawerBtnPressed
//                 ))
//           ],
//         )),
//   ),
// ),
// endDrawer: Drawer(
//   child: ListView(
//     padding: EdgeInsets.zero,
//     children: <Widget>[
//       DrawerHeader(
//         child: Text('Drawer Header'),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//         ),
//       ),
//       ListTile(
//         title: Text('Item 1'),
//         onTap: () {},
//       ),
//       ListTile(
//         title: Text('Item 2'),
//         onTap: () {},
//       ),
//     ],
//   ),
// ),  // Future<void> Getit()async{
//   //
//   //   //print(value);
//   //
//   //
//   // }//------- AdMobAds -----------
//
//
//   // List<String> items = [
//   //   //
//   //   'si',//Slovenia
//   //   'sk',//Slovakia
//   //   'th',//Thailand
//   //   'tr',//Turkey
//   //   'tw',//Taiwan
//   //   'ua',//Ukraine
//   //   'us',//United States of America
//   //   've',//Venezuela
//   //   'za',//Tanzania
//   //   'jp',//Japan
//   //   'kr',//South Korea
//   //   'lt',//Lithuania
//   //   'lv',//Latvia
//   //   'ma',//Morocco
//   //   'mx',//Mexico
//   //   'my',//Malaysia
//   //   'ng',//Nigeria
//   //   'nl',//Netherlands
//   //   'no',//Norway
//   //   'nz',//New Zealand
//   //   'ph',//Philippines
//   //   'pl',//Poland
//   //   'pt',//Portugal
//   //   'ro',//Romania
//   //   'rs',//Serbia
//   //   'ru',//Russian Federation
//   //   'sa',//Saudi Arabia
//   //   'se',//Sweden
//   //   'sg',//Singapore
//   //   'ae',//United Arab Emirates
//   //   'ar',//Argentina
//   //   'at',//Austria
//   //   'au',//Australia
//   //   'be',//Belgium
//   //   'bg',//Bulgaria
//   //   'br',//Brazil
//   //   'ca',//Canada
//   //   'ch',//Switzerland
//   //   'cn',//China
//   //   'co',//Colombia
//   //   'cu',//Cuba
//   //   'cz',//Czech rep.
//   //   'de',//Federal Republic of Germany
//   //   'eg',//Egypt
//   //   'fr',//France
//   //   'gb',//United Kingdom
//   //   'gr',//Greece
//   //   'hk',//Hong Kong
//   //   'hu',//Hungary
//   //   'id',//Indonesia
//   //   'ie',//reland
//   //   'il',//Israel
//   //   'in',//India
//   //   'it',//Italy
//   //
//   // ];