import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simpleprofile/editable_profile/profile_model.dart';


class Editable_MyProfile2 extends StatefulWidget {
  Profile? profile;
  Editable_MyProfile2({Key? key,this.profile}) : super(key: key);

  @override
  _Editable_MyProfile2 createState() => _Editable_MyProfile2();
}

class _Editable_MyProfile2 extends State<Editable_MyProfile2> {
  @override
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtNgaySinh = TextEditingController();
  TextEditingController txtQueQuan = TextEditingController();
  TextEditingController txtSothich = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit My Profile"),

      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  controller: txtTen,
                  decoration: InputDecoration(

                      labelText: 'Tên',

                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(2.0),
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txtNgaySinh,
                  decoration: InputDecoration(
                      labelText: 'Ngày sinh',

                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(2.0),
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: txtQueQuan,
                  decoration: InputDecoration(
                      labelText: 'Quê quán',

                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(2.0),
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                    controller: txtSothich,
                  decoration: InputDecoration(
                      labelText: 'Sở thích',

                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(2.0),
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [

                    ElevatedButton(onPressed: (){
                      widget.profile?.name =txtTen.text;
                      widget.profile?.ngaySinh = txtNgaySinh.text;
                      widget.profile?.quequan = txtQueQuan.text;
                      widget.profile?.soThich = txtSothich.text;
                      Navigator.pop(context,widget.profile);
                    }, child: Text("OK")),
                  ],
                )

              ],
            ),

          ),


        ),


      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    txtTen.text = widget.profile?.name?? "Không có tên";
    txtNgaySinh.text = widget.profile?.ngaySinh?? "Không có ngày sinh";
    txtQueQuan.text = widget.profile?.quequan?? "Không có quê quán";
    txtSothich.text = widget.profile?.soThich?? "Không có quê quán";

    super.initState();
  }
}