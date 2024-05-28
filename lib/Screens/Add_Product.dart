import 'package:crud_rest_api_assignment/Style/Style.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {


  Map<String, dynamic> formValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  bool Loading = false;

  void inputOnChanged(MapKey, TextValue) {
    setState(() {
      formValues.update(MapKey, (value) => TextValue);
    });
  }

  FromOnSubmit() async {
    if (formValues["Img"]!.length == 0) {
      Errortoats("Please Insert Image");
    }
    else if (formValues["ProductCode"]!.length == 0) {
      Errortoats("Please Insert ProductCode");
    }
    else if (formValues["ProductName"]!.length == 0) {
      Errortoats("Please Insert ProductName");
    }

    else if (formValues["Qty"]!.length == 0) {
      Errortoats("Please Insert Product Quantity");
    }
    else if (formValues["TotalPrice"]!.length == 0) {
      Errortoats("Please Insert Product Total Price");
    }
    else if (formValues["UnitPrice"]!.length == 0) {
      Errortoats("Please Insert Product Unit Price");
    }
    else {
      setState(() {
        Loading = true;
      });
      await ProductCreateRequest(formValues);

      setState(() {
        Loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
        ),
        body: Stack(
          children: [
            Container(
              child: Loading
                  ? (Center(child: CircularProgressIndicator(),))
                  : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(

                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("ProductName", textValue);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          decoration: InputDecoration(
                              hintText: "Name",
                              labelText: "Name"
                          ),
                          validator: (String? value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Write the Product Name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("ProductCode", textValue);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,

                          decoration: InputDecoration(
                            hintText: "Code",
                            labelText: "ProductCode",
                          ),
                          validator: (String? value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Write the Product Code';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("UnitPrice", textValue);
                          },

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Unit Price",
                              labelText: "Unit Price"
                          ),
                          validator: (String? value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Write the Product Unit Price';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("Qty", textValue);
                          },

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Quantity",
                              labelText: "Quantity"
                          ),
                          validator: (String? value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Write the Product Quantity';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("TotalPrice", textValue);
                          },

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Total Price",
                              labelText: "Total Price"
                          ),
                          validator: (String? value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Write the Product Total Price';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("Img", textValue);
                          },

                          decoration: InputDecoration(
                              hintText: "Image",
                              labelText: "Image"
                          ),
                          validator: (String? value) {
                            if (value == null || value
                                .trim()
                                .isEmpty) {
                              return 'Write the Product Image URL';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            FromOnSubmit();
                          },
                          child: Text("Add Product"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }

}
