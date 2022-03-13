import 'package:flutter/material.dart';
import 'package:newsapii/models/News_Model/newsInfo.dart';
import 'package:newsapii/AdsManager.dart';
import 'package:newsapii/UI/FirstPage.dart';
import 'package:newsapii/Data/News_Manager/api_manager.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

String country;
String category;

class HomePage extends StatefulWidget {
  final instance = API_Manager();
  final homeinstance = Home();
  final Adsinstance = AdsManager();
  String selectedValue;
  HomePage(){

    // instance.CuntryStream.listen((event) async{
    //   print(event);
    //   print("inside Second Stream Cuntry ofc");
    //   country= await event;
    //
    // });

  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final instance = API_Manager();
  final Homeinstance = Home();
  final Adsinstance = AdsManager();
  BannerAd _BannerAd1;
  BannerAd _BannerAd2;
  BannerAd _BannerAd3;
  BannerAd _BannerAd4;

  bool isLoaded = false;
  AdsManager adManager;
  @override
  void initState() {
    instance.actionSink.add(NewsAction.Fetch);
    super.initState();
  }


  _launchURL(String url) async{

try{
       await launch(url);
}
    catch(e){
  print(e);
    }

  }

  @override
  void dispose() {
    super.dispose();
    instance.dispose();


  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Adsinstance.getbanner( "ca-app-pub-3237644024612902/2174325900",_BannerAd1, false),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text( "News"),
      ),

      body: Container(
        width: w,
        height: h*2,

        child: StreamBuilder<List<Article>>(//we make this<> to access the ariticles.length
          stream: instance.Newsstream,//this has all the data
          builder: (context, snapshot) {//then passed to snapshot
            print(snapshot.data);
            print(snapshot.hasData);

            if (snapshot.hasData) {
              return ListView.builder(
                    itemCount: snapshot.data.length,//here
                    itemBuilder: (context, index) {

                      var article = snapshot.data[index];
                      var formattedTime = DateFormat('dd MMM - HH:mm')
                          .format(article.publishedAt);
                      print(article);

                      return Column(
                        children: [
                          (index==4 || index ==10 || index == 14)
                              ? Adsinstance.getbanner(
                              index==4
                                  ?"ca-app-pub-3237644024612902/7810576218"
                                  :index==10
                                        ?"ca-app-pub-3237644024612902/8976356210"
                                       :"ca-app-pub-3237644024612902/5859238283",


                            index==4
                                ?_BannerAd2
                                :index==10
                                ?_BannerAd3
                                :_BannerAd4,
                              false




                          )
                              :SizedBox(height: 0,),
                          InkWell(
                            onTap: () async{
                              article.url!=null && article.url!="" ? await _launchURL(article.url.toString()):print("no url");
                              print("no url");
                            },
                            child: Container(
                              height: 100,
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.network(

                                          article.urlToImage!=null&& article.urlToImage!=""?article.urlToImage:"https://images.unsplash.com/photo-1628155930542-3c7a64e2c833?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
                                          fit: BoxFit.cover,
                                          errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
                                            return Icon(Icons.do_not_disturb);
                                          },
                                        )),
                                  ),
                                  SizedBox(width: 16),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(formattedTime),
                                        Text(
                                          article.title!=null &&article.title!=""?article.title:"No Title" ,
                                          overflow: TextOverflow.ellipsis,//makes three dots if there is no space
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          article.description!=null && article.description!=""?article.description:"No description",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,//three dots if there is no space
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
              );
            }
            else if (snapshot.hasError){
              print(snapshot.error);
              return Center(
                child: Text("error"),
              );
            }
            else if (snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else {
              return Text("SomethiNG WENT WRONG");
            }

          },
        ),
      ),




     
    );
  }
}
//
//   Slovenia
//   Slovakia
//  Thailand
//  Turkey
// Taiwan
//  Ukraine
// United States of America
// Venezuela
//  Tanzania
//  Japan
//  South Korea
// Lithuania
//   Latvia
// Morocco
// Mexico
// Malaysia
// Nigeria
// Netherlands
// Norway
// New Zealand
// Philippines
// Poland
//  Portugal
//   Romania
// Serbia
// Russian Federation
// Saudi Arabia
// Sweden
// Singapore
// United Arab Emirates
// Argentina
//   Austria
//  Australia
//  Belgium
// Bulgaria
//  Brazil
// Canada
//  Switzerland//China
// Colombia
//  Cuba
// Czech rep.
// Federal Republic of Germany
// Egypt
// France
// United Kingdom
// Greece
// Hong Kong
// Hungary
// Indonesia
// reland
// Israel
// India
// Italy
///------- AdMobAds ----------- ///

//------- AdMobAds -----------

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
// //------- AdMobAds -----------
//     adManager = Provider.of<AdsManager>(context);
//     adManager.initialization.then((value) {
//       getBottomBannerAd(adManager);
//     });
//     //------- AdMobAds -----------
//   }

