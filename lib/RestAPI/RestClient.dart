import 'dart:convert';
import 'package:crud_rest_api_assignment/Style/Style.dart';
import 'package:http/http.dart' as http;

Future <bool>ProductCreateRequest(formValues) async{
var URL =Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
var PostBody=json.encode(formValues);
var PostHeader ={"Content-Type":"application/json"};

var response= await  http.post(URL,headers: PostHeader,body: PostBody);
var Resultcode=response.statusCode;
var Resultbody =json.decode(response.body) ;
if (Resultcode==200 && Resultbody['status']== "success" ){
  
  Successtoats("Request Success");
  return true;

}
else{
  Errortoats("Request failed");
  return false;
}

}


Future<List> ProductGridViewListRequest() async {
  
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
  var GetHeader={"Content-type":"applocation/json"};
  var response= await http.get(URL,headers:GetHeader );
  var Resultcode=response.statusCode;
  var ResultBody= json.decode(response.body);

  if (Resultcode==200 && ResultBody['status']=='success'){

    Successtoats("Request Success");
    return ResultBody['data'];
  }
  else{

    Errortoats("Request Failed");
    return [];
  }

}
Future<bool> ProductDeleteRequest(id) async{

  var URL =Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var PostHeader ={"Content-Type":"application/json"};
  var response= await http.get(URL,headers: PostHeader);
  var Resultcode=response.statusCode;
  var Resultbody =json.decode(response.body) ;

  if (Resultcode==200 && Resultbody['status']== "success" ){

    Successtoats("Request Success");
    return true;

  }
  else{
    Errortoats("Request failed");
    return false;
  }

}



Future <bool>ProductUpdateRequest(formValues,id) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/" + id);
  var PostBody = json.encode(formValues);
  var PostHeader = {"Content-Type": "application/json"};

  var response = await http.post(URL, headers: PostHeader, body: PostBody);
  var Resultcode = response.statusCode;
  var Resultbody = json.decode(response.body);
  if (Resultcode == 200 && Resultbody['status'] == "success") {
    Successtoats("Request Success");
    return true;
  }
  else {
    Errortoats("Request failed");
    return false;
  }
}
