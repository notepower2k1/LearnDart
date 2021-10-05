
import 'package:flutter/material.dart';
import 'package:simpleprofile/editable_profile/profile_model.dart';

import 'edit_profile.dart';

class Editable_MyProfile extends StatefulWidget {
  const Editable_MyProfile({Key? key}) : super(key: key);

  @override
  _Editable_MyProfile createState() => _Editable_MyProfile();
}

class _Editable_MyProfile extends State<Editable_MyProfile> {
  //String groupValue = "Nam";
  //String operator = "+";

  Profile? profile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 320, height: 320,
                    child: Image.asset(profile?.anh?? "assets/images/Programming-Memes.jpg"),
                  ),
                ),
                SizedBox(height: 10,),
                Text("Họ và Tên:"),
                Text("\t${profile?.name}", style: TextStyle(color: Colors.blue,
                    fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Ngày sinh:"),
                Text("\t${profile?.ngaySinh}", style: TextStyle(fontSize: 20,)),
                SizedBox(height: 10,),
                Text("Giới tính:"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: "Nam",
                          groupValue:profile?.gioitinh,
                          onChanged: (value) {
                            setState(() {
                              profile?.gioitinh = value as String;
                            });
                          },
                        ),
                        Text("Nam")
                      ],

                    ),
                    Row( children: [
                      Radio<String>(
                        value: "Nữ",
                        groupValue:profile?.gioitinh,
                        onChanged: (value) {
                          setState(() {
                            profile?.gioitinh = value as String;
                          });
                        },
                      ),
                      Text("Nữ")
                    ],)
                  ],
                ),
                Text("Quê quán:"),
                Text("\t${profile?.quequan}", style: TextStyle(fontSize: 20,)),
                SizedBox(height: 10,),
                Text("Sở thích:"),
                Text("\t${profile?.soThich}", style: TextStyle(
                  fontSize: 20, fontStyle: FontStyle.italic,)),
                SizedBox(height: 10,),
                Text("Phép tính giỏi nhất của bạn:"),

                DropdownButton(
                    isExpanded: true,
                    value: profile?.pheptinh,
                    onChanged: (value) {
                      setState(() {
                        profile?.pheptinh = value as String;
                      });
                    },
                    items:[
                      DropdownMenuItem(
                        value: "+",
                        child: Text("Cộng"),
                      ),
                      DropdownMenuItem(
                        value: "-",
                        child: Text("Trừ"),
                      ),
                      DropdownMenuItem(
                        value: "*",
                        child: Text("Nhân"),
                      ),
                      DropdownMenuItem(
                        value: "/",
                        child: Text("Chia"),
                      ),
                    ]
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: () => editprofile(context),
                        child: Text("Chỉnh sửa")),
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
    profile = Profile(
        gioitinh: 'Nam',
        name: 'Nguyễn Văn Thạch',
      ngaySinh: "06/03/2001",
      soThich: 'Game,Doc Sach',
      anh: "assets/images/Programming-Memes.jpg",
      quequan: "Khanh Hoa",
      pheptinh: "+",
    );

    super.initState();
  }

  editprofile(BuildContext context) async {
    profile = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Editable_MyProfile2(profile:profile,),),
    );
    setState((){

    });
  }

}
