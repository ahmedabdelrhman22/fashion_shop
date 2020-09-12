import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashionadmin/db/category.dart';
import 'package:fashionadmin/db/brand.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fashionadmin/db/product.dart';



class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  CategoryService _categoryService=CategoryService();
  BrandService _brandService=BrandService();
  ProductService _productService=ProductService();


  GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  TextEditingController productNameController=new TextEditingController();
  TextEditingController productQuantityController=new TextEditingController();
  TextEditingController productPriceController=new TextEditingController();
  List<DocumentSnapshot> brands=<DocumentSnapshot>[];
  List<DocumentSnapshot> categories=<DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropdown =<DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropdown =<DropdownMenuItem<String>>[];
  String _currentBrand;
  String _currentCategory;
List<String> selectedSizes= <String>[];
File _fileimage1;
  File _fileimage2;
  File _fileimage3;
  bool isloading=false;


  Color white=Colors.white;
  Color black=Colors.black;
  Color grey=Colors.grey;
  Color pink=Colors.pink;





  @override
  void initState() {
    _getCategories();
    _getBrands();

   // _currentCategory=categoriesDropdown[0].value;
  }

 List<DropdownMenuItem<String>>  getCategoryDropDown()
  {

   List<DropdownMenuItem<String>> items= new List();
   for(int i=0;i< categories.length; i++)
     {
    setState(() {
      items.insert(0,new DropdownMenuItem(child: Text(categories[i].data['categoery']),
        value:categories[i].data['categoery'] ,));
    });
     
     }
             return items;
  }
  List<DropdownMenuItem<String>>  getBrandDropDown()
  {

    List<DropdownMenuItem<String>> items= new List();
    for(int i=0;i< brands.length; i++)
    {
      setState(() {
        items.insert(0,new DropdownMenuItem(child: Text(brands[i].data['brand']),
          value:brands[i].data['brand'] ,));
      });


    }

    return items;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0,
        title:Text('Add product',style: TextStyle(color: black),
      ),
        backgroundColor: white,
        leading: Icon(Icons.close,color: black,
        ),
      ),
      body:Form(
        key: _formKey,
        child: isloading ? CircularProgressIndicator(): ListView(
          children: <Widget>[
            Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(borderSide:BorderSide(color: grey.withOpacity(0.5),width: 2.5),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0,40.0,15.0,40.0),
                        child: _displaychild1()
                      ),
                      onPressed: (){
                    _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),1);

                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(borderSide:BorderSide(color: grey.withOpacity(0.5),width: 2.5),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0,40.0,15.0,40.0),
                        child: _displaychild2()
                      ),
                      onPressed: (){
                        _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),2);

                      }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(borderSide:BorderSide(color: grey.withOpacity(0.5),width: 2.5),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15.0,40.0,15.0,40.0),
                        child: _displaychild3()
                      ),
                      onPressed: (){
                        _selectImage(ImagePicker.pickImage(source: ImageSource.gallery),3);

                      }),
                ),
              )
            ],
            ),
































            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Enter product name with 10 characters at maximum ',style: TextStyle(color: pink,fontSize: 12.0),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productNameController,
                decoration: InputDecoration(
                  hintText: 'Add name',
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'You must enter the product name';
                  }
                  else if(value.length>10)
                    {
                      return'product name can not have more than 10 letters';

                    }

                }
                ,
              ),
            ),
 //************************ Add category**************************
            

Row(children: <Widget>[
  Expanded(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text('Category',style: TextStyle(color: pink),),
    ),
  ),
  DropdownButton(items: categoriesDropdown,onChanged: changeSelectedCategory,value:_currentCategory

    ,),
  Expanded(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text('Brand',style: TextStyle(color: pink),),
    ),
  ),
  DropdownButton(items: brandsDropdown,onChanged: changeSelectedBrand,value: _currentBrand

    ,),
  


],



),



// **************************************Add quantity*******************************************

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productQuantityController,

                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:'Quantity' ,
                  hintText: 'Quantity',
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'You must enter the product quantity';
                  }


                }
                ,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: productPriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:'Price' ,

                  hintText: 'Price',
                ),
                validator: (value) {
                  if(value.isEmpty) {
                    return 'You must enter the product price';
                  }


                }
                ,
              ),
            ),
Text('Available sizes',style: TextStyle(color: pink),textAlign: TextAlign.center,),
Row(

  children: <Widget>[

    Checkbox(value: selectedSizes.contains('S'), onChanged:  (value)=>changeSelectedSize(value,'S')),
    Text('S',style: TextStyle(color: pink)),
    Checkbox(value: selectedSizes.contains('M'), onChanged:  (value)=>changeSelectedSize(value,'M')),
    Text('M',style: TextStyle(color: pink)),
    Checkbox(value: selectedSizes.contains('L'), onChanged:  (value)=>changeSelectedSize(value,'L')),
    Text('L',style: TextStyle(color: pink)),
    Checkbox(value: selectedSizes.contains('XL'), onChanged:  (value)=>changeSelectedSize(value,'XL')),
    Text('XL',style: TextStyle(color: pink)),
    Checkbox(value: selectedSizes.contains('XXL'), onChanged:  (value)=>changeSelectedSize(value,'XXL')),
    Text('XXL',style: TextStyle(color: pink)),

  ],

),
            Row(

              children: <Widget>[
                Checkbox(value: selectedSizes.contains('28'), onChanged:  (value)=>changeSelectedSize(value,'28')),
                Text('28',style: TextStyle(color: pink)),
                Checkbox(value: selectedSizes.contains('30'), onChanged:  (value)=>changeSelectedSize(value,'30')),
                Text('30',style: TextStyle(color: pink)),
                Checkbox(value: selectedSizes.contains('32'), onChanged:  (value)=>changeSelectedSize(value,'32')),
                Text('32',style: TextStyle(color: pink)),
                Checkbox(value: selectedSizes.contains('34'), onChanged:  (value)=>changeSelectedSize(value,'34')),
                Text('34',style: TextStyle(color: pink)),
                Checkbox(value: selectedSizes.contains('36'), onChanged:  (value)=>changeSelectedSize(value,'36')),
                Text('36',style: TextStyle(color: pink)),


              ],

            ),
            Row(

              children: <Widget>[
                Checkbox(value: selectedSizes.contains('40'), onChanged:  (value)=>changeSelectedSize(value,'40')),
                Text('40',style: TextStyle(color: pink)),
                Checkbox(value: selectedSizes.contains('42'), onChanged:  (value)=>changeSelectedSize(value,'42')),
                Text('42',style: TextStyle(color: pink)),
                Checkbox(value: selectedSizes.contains('44'), onChanged:  (value)=>changeSelectedSize(value,'44')),
                Text('44',style: TextStyle(color: pink)),
                Checkbox(value: selectedSizes.contains('46'), onChanged:  (value)=>changeSelectedSize(value,'46')),
                Text('46',style: TextStyle(color: pink)),
                Checkbox(value: selectedSizes.contains('48'), onChanged:  (value)=>changeSelectedSize(value,'48')),
                Text('48',style: TextStyle(color: pink)),


              ],

            ),
Expanded(
  child:   Padding(
  
    padding: const EdgeInsets.all(8.0),
  
    child:   FlatButton(child:Text('Add product'),color:pink,textColor:white,onPressed: (){
      validateAndUpload();
    }),
  
  ),
),



























//            Visibility(
//              visible:_currentCategory!=null ,
//              child: InkWell(
//
//                child:Material(
//                  borderRadius:BorderRadius.circular(20) ,
//                  color: pink,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(_currentCategory ??'null',style: TextStyle(color: white),),
//                        ),
//                        IconButton(icon: Icon(Icons.close,color: white,), onPressed: (){
//                          setState(() {
//                            _currentCategory='';
//                          });
//                        }),
//                      ],
//                    ),
//                  ),
//                ),
//
//
//
//
//              ),
//
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: TypeAheadField(
//                textFieldConfiguration: TextFieldConfiguration(
//                    autofocus: false,
//
//                    decoration: InputDecoration(
//                        hintText: 'Add category'
//                    )
//                ),
//                suggestionsCallback: (pattern) async {
//              return await _categoryService.getSuggestions(pattern);
//                },
//                itemBuilder: (context, suggestion) {
//                  return ListTile(
//                    leading: Icon(Icons.category),
//                    title: Text(suggestion['categoery']),
//                  );
//                },
//                onSuggestionSelected: (suggestion) {
//        setState(() {
//          _currentCategory=suggestion['categoery'];
//        });
//                },
//              ),
//            ),




// ----------------------------Add brand-----------------------------------
//            Visibility(
//              visible:_currentBrand!=null ,
//              child: InkWell(
//
//                child:Material(
//                  borderRadius:BorderRadius.circular(20) ,
//                  color: pink,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Text(_currentBrand ?? 'null',style: TextStyle(color: white),),
//                        ),
//                        IconButton(icon: Icon(Icons.close,color: white,), onPressed: (){
//                          setState(() {
//                            _currentBrand='';
//                          });
//                        }),
//                      ],
//                    ),
//                  ),
//                ),
//
//
//
//
//              ),
//
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: TypeAheadField(
//                textFieldConfiguration: TextFieldConfiguration(
//                    autofocus: false,
//
//                    decoration: InputDecoration(
//                        hintText: 'Add brand'
//                    )
//                ),
//                suggestionsCallback: (pattern) async {
//                  return await _brandService.getSuggestionss(pattern);
//                },
//                itemBuilder: (context, suggestion) {
//                  return ListTile(
//                    leading: Icon(Icons.branding_watermark),
//                    title: Text(suggestion['brand']),
//                  );
//                },
//                onSuggestionSelected: (suggestion) {
//                  setState(() {
//                    _currentBrand=suggestion['brand'];
//                  });
//                },
//              ),
//            ),

          ],

        ),
      ) ,

    );
  }

  void _getCategories() async{
    List<DocumentSnapshot>data=await _categoryService.getCategories();
    setState(() {
      categories=data;
     categoriesDropdown= getCategoryDropDown();

      _currentCategory=categories[0].data['categoery'];

    });

  }

  changeSelectedCategory(String selectedCategory) {

setState(() {
  _currentCategory=selectedCategory;
});


  }


  void _getBrands() async{
    List<DocumentSnapshot>data=await _brandService.getBrands();
    setState(() {
      brands=data;
      brandsDropdown= getBrandDropDown();

      _currentBrand=brands[0].data['brand'];

    });

  }

  changeSelectedBrand(String selectedBrand) {

    setState(() {
      _currentBrand=selectedBrand;
    });


  }

  void changeSelectedSize(bool value,String size) {
    if(selectedSizes.contains(size)){
      setState(() {
        selectedSizes.remove(size);

      });

    }
    else
      {
        setState(() {
          selectedSizes.insert(0,size);

        });
        print(selectedSizes);


      }


  }

  void _selectImage(Future<File> pickImage,int imagenum)async {
    File tempimage=await pickImage;
    switch(imagenum) {
    case 1: setState(() =>
    _fileimage1=tempimage
    );
    break;
      case 2: setState(() =>
      _fileimage2=tempimage
      );
      break;
      case 3: setState(() =>
      _fileimage3=tempimage
      );
      break;

    }


  }


  Widget _displaychild1() {
    if( _fileimage1==null)
    {
      return Padding (  padding: const EdgeInsets.fromLTRB(15.0,40.0,15.0,40.0),
        child: Icon(Icons.add,color: grey,

        ),
      );
    }
    else{
      return Image.file(_fileimage1,fit: BoxFit.fill,width: double.infinity,);


    }
  }

  Widget _displaychild2() {
    if( _fileimage2==null)
    {
      return Padding (  padding: const EdgeInsets.fromLTRB(15.0,40.0,15.0,40.0),
        child: Icon(Icons.add,color: grey,

        ),
      );
    }
    else{
      return Image.file(_fileimage2,fit: BoxFit.fill,width: double.infinity,);



    }
  }
  Widget _displaychild3() {
    if( _fileimage3==null)
    {
      return Padding (  padding: const EdgeInsets.fromLTRB(15.0,40.0,15.0,40.0),
        child: Icon(Icons.add,color: grey,

        ),
      );
    }
    else{
      return Image.file(_fileimage3,fit: BoxFit.fill,width: double.infinity,);




    }
  }

  Future<void> validateAndUpload() async {
    if(_formKey.currentState.validate())
      {
        setState(() =>
          isloading=true
        );

        if(_fileimage1!=null &&_fileimage2!=null && _fileimage3!=null)
          {
            if(selectedSizes.isNotEmpty)

              {
                String imageUrl;
                String imageUr2;
                String imageUr3;

                final FirebaseStorage storage=FirebaseStorage.instance;
                final String picture1="1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                final String picture2="2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
                final String picture3="3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";

                StorageUploadTask task1= storage.ref().child(picture1).putFile(_fileimage1);
                StorageUploadTask task2= storage.ref().child(picture2).putFile(_fileimage2);
                StorageUploadTask task3= storage.ref().child(picture3).putFile(_fileimage3);
                StorageTaskSnapshot snapshot1=await task1.onComplete.then((snapshot) => snapshot);
                StorageTaskSnapshot snapshot2=await task2.onComplete.then((snapshot) => snapshot);
//                StorageTaskSnapshot snapshot3=await task3.onComplete.then((snapshot) => snapshot);

                task3.onComplete.then((snapshot3) async {
                  imageUrl= await snapshot1.ref.getDownloadURL();
                  imageUr2= await snapshot2.ref.getDownloadURL();
                  imageUr3= await snapshot3.ref.getDownloadURL();
                  List<String> imageList=[imageUrl,imageUr2,imageUr3];
                  _productService.uploadProduct(ProductName:productNameController.text,
                      price: double.parse(productPriceController.text),
                  brand: _currentBrand,
                  category: _currentCategory,
                  images: imageList,
                  sizes: selectedSizes,
                  quantity:int.parse(productQuantityController.text),

                  );
                  _formKey.currentState.reset();
                  setState(() =>
                  isloading=false
                  );

                  Fluttertoast.showToast(msg: 'Product added');
                  Navigator.pop(context);



                });



              }
              else{
              setState(() =>
              isloading=false
              );
              Fluttertoast.showToast(msg: 'Select at least one size');

            }


          }
          else{
          setState(() =>
          isloading=false
          );
            Fluttertoast.showToast(msg: 'All images must be provided');
        }
      }
  }
}
