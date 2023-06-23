import 'package:flutter/material.dart';
import 'package:list_sample/List_Update/Structured%20map.dart';

class List_Update extends StatefulWidget {
  

  @override
  State<List_Update> createState() => _List_UpdateState();
  }

  class _List_UpdateState extends State<List_Update> {

  final TextEditingController nameController=TextEditingController();
  final TextEditingController ageController=TextEditingController();
  final TextEditingController addressController=TextEditingController();
  final TextEditingController countryController=TextEditingController();

  final List<Details> messages = [];
  
  var selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar: AppBar(title: const Text("List Update"),),
      body: ListView(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Name"),),
          TextField(
            controller: ageController,
            decoration: InputDecoration(hintText: "Age"),),
          TextField(
            controller: addressController,
            decoration: InputDecoration(hintText: "Address"),),
          TextField(
            controller: countryController,
            decoration: InputDecoration(hintText: "Country"),),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            SaveData(selectedIndex);
          }, child: const Text("Save")),

            ListView.builder(
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var data = messages[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      selectedIndex=index;
                      displayDetails(data);
                    },
                    child: Card(
                      color: Colors.lightBlueAccent[200],
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [  
                              SizedBox(height: 15,),
                              Text("       Person Details",style: TextStyle(fontWeight: FontWeight.bold),),
                              SizedBox(height: 15,),
                              Text('Name    : ${data.name}'),
                              Text('Age        : ${data.age}'),
                              Text('Place     : ${data.address}'),
                              Text('Country : ${data.country}'),
                              SizedBox(height: 15,),
                              ],),
                      ),
                    ),
                  ),
                );
            }) ],
      ),
    );
  }

void SaveData(index) {
  final name1 = nameController.text;
  final age1 = int.parse(ageController.text);
  final address1 = addressController.text;
  final country1 = countryController.text;

   
   if (index > -1 ) {
      // Add updated data
      messages[index].name=name1;
      messages[index].age=age1;
      messages[index].address=address1;
      messages[index].country=country1;
    }

  else{
    // Add new data
    messages.add(Details(
      age: age1,
      name: name1,
      address: address1,
      country: country1,
    ));}
 
  nameController.clear();
  ageController.clear();
  addressController.clear();
  countryController.clear();
  
  selectedIndex=-1;
  
  setState(() {});
}

  void displayDetails(Details data) {
  nameController.text = data.name.toString();
  ageController.text = data.age.toString();
  addressController.text = data.address.toString();
  countryController.text = data.country.toString();
  

  }
}