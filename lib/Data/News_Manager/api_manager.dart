import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapii/Core/constants/strings.dart';
import 'package:newsapii/models/News_Model/newsInfo.dart';
import 'package:newsapii/UI/FirstPage.dart';
import 'package:newsapii/UI/homepage.dart';
String Country;
String category;
enum NewsAction{delete,Fetch,reset}
class API_Manager  {
  final Instance =  Home();

  final _STringStreamcontroller = StreamController.broadcast();//this controls the operations
  StreamSink get CuntrySink  => _STringStreamcontroller.sink;
  Stream get CuntryStream  => _STringStreamcontroller.stream;


  final _categoryStreamcontroller = StreamController<String>();//this controls the operations
  StreamSink<String> get CATsink  => _categoryStreamcontroller.sink;
  Stream<String> get Catstream  => _categoryStreamcontroller.stream;


  final _stateStreamcontroller = StreamController<List<Article>>();//this controls the operations
  StreamSink<List<Article>> get NewsSink  => _stateStreamcontroller.sink;
  Stream<List<Article>> get Newsstream  => _stateStreamcontroller.stream;

  final _actionStreamcontroller = StreamController<NewsAction>();
  StreamSink<NewsAction> get actionSink  => _actionStreamcontroller.sink;
  Stream<NewsAction> get actionStream  => _actionStreamcontroller.stream;

  API_Manager(){

    CuntryStream.listen((event) {
print("Inide envet");
print(Country);
print(category);

      Country=event;
      print(Country);
      print(event);
    });
    Catstream.listen((event) {
print("Inide envet Cat");
      category=event;
      print(category);
      print(event);
    });
    actionStream.listen((event) async{

      if (event == NewsAction.Fetch){
        print("inside Listener");
       print(Country);
        try {
          var _newsModel;
        print("$Country inside  of try");
          _newsModel = await getNews();
          print("$Country inside  of try22222222222");
          print("$_newsModel inside  of try22222222222");
          if (_newsModel!=null)
          {
        //  print(Country+"after getnews");
         // print(_newsModel.status);
          NewsSink.add(_newsModel.articles.toList());
          }


        }catch(e){
          NewsSink.addError("Caught an error : "+e.toString());

        }
      }
      else {
        print("DIDN'T DO THE REQUEST");
      }

    });


  }
  Future<Welcome> getNews() async {//as i understood "Future" is with async and await if not used won't make the major change
    //but it used its healthy async dely.
    var client = http.Client();
    var newsModel;
   // var Country= Value;

    try {
      print("$Country seconds");
      var response = await client.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=$Country&category=$category&apiKey=29b2628c86ba49f0951e3785fb5ed0e1"));
      print("${response.body} inside  of try22222222222");
      if (response.statusCode == 200) {//200 means no error found in status
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);//first step to making it as a map
        newsModel = Welcome.fromJson(jsonMap);// make it as a map using the model Code
        print(jsonMap.toString());
      }
    } catch (Exception) {
      return newsModel;//return jsonmap
    }

    return newsModel;//return jsonmap
  }
  void dispose(){
    _stateStreamcontroller.close();
    _actionStreamcontroller.close();
  }
}
