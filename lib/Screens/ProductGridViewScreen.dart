import 'package:crud_rest_api_assignment/Screens/Update_Product.dart';
import 'package:crud_rest_api_assignment/Style/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../RestAPI/RestClient.dart';
import 'Add_Product.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  List ProductList = [];
  bool Loading = true;

  @override
  void initState() {
    super.initState();
    CallData();
  }

  CallData() async {

      Loading = true;


    var data = await ProductGridViewListRequest();
    setState(() {
      ProductList = data;
      Loading = false;
    });
  }


DeleteItem(id)async{
    
showDialog(
    context: context,
    builder: (BuildContext context){

      return AlertDialog(
        title: Text("Delete !"),
        content: Text("Are you sure ?"),
        actions: [
          OutlinedButton(onPressed: () async {

            Navigator.pop(context);

            setState(() {
              Loading = true;
            });

            await ProductDeleteRequest(id);

           await CallData();

          },

              child: Text('Yes')),
          OutlinedButton(onPressed: () {

            Navigator.pop(context);
          },

              child: Text('Cancel')),
        ],
      );
    }
);
}


  GotoUpdate(context,ProductItem){

    Navigator.push(context, MaterialPageRoute(builder:(context)=> UpdateProduct(ProductItem)));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("ProductList",style: TextStyle(color: colorwhite),),
      ),
      body: Stack(
        children: [
          Container(
            child: Loading?(Center(child: CircularProgressIndicator(),)):

            RefreshIndicator(
              onRefresh: () async {
                await CallData();
              }
              ,
              child: GridView.builder


                (gridDelegate: ProductGridViewStyle(),
                itemCount: ProductList.length,
                itemBuilder: (context,index){
                  return Card(
                    child:Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(child:
                        Image.network(ProductList[index]['Img'] ?? '',fit: BoxFit.fill,)),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5,5,8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ProductList[index]['ProductName'],
                              ),
                              SizedBox(height: 7,),
                              Text(ProductList[index]['ProductCode'],),
                              SizedBox(height: 7,),
                              Text(ProductList[index]['UnitPrice'] +" "+"BDT",),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [


                                  OutlinedButton(onPressed: ()
                                  {
                                   GotoUpdate(context,ProductList[index]);

                                  }, child: Icon(CupertinoIcons.ellipsis_vertical_circle,size: 17,color: colorGreen,)),
                                  SizedBox(width: 4,),
                                  OutlinedButton(onPressed: ()
                                  {
                                   DeleteItem(ProductList[index]['_id']);

                                  }, child: Icon(CupertinoIcons.delete,size: 17,color: colorRed,)),




                                ],
                              )
                            ],

                          ),


                        )
                      ],
                    ) ,
                  );

                },
              ),
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> AddProduct()));
      },child: Icon(Icons.add),),
    );


  }
}