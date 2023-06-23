
class Details{
  String? name;
  int? age;
  String? address;
  String? country;

 Details({this.name,this.age,this.address,this.country});

 Map<String,dynamic> display(){
   return {"name":name,"age":age,"address":address,"country":country};
 }
}