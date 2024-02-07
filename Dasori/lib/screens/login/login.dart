import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:dasori/providers/auth_provider.dart';
import 'package:dasori/screens/login/signup.dart';

final List<String> nation_list = <String>['Vietnam', 'Philippines','China'];
var selectedValue = '언어를 선택하세요.';

class login extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) { //나중에 홈페이지 만들면 context 넣어주기
    return Scaffold(
      backgroundColor: Color(0xff8DBFD2),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(//언어설정
              padding: EdgeInsets.fromLTRB(40,20,0,0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.language,
                    size: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: DropdownMenuExample(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/main_icon.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _idController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.person),
                    prefixIconColor:Colors.white,
                    labelText: 'ID'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.key),
                    prefixIconColor:Colors.white,
                    labelText: 'Password'
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  print('login button press');
                  // 로그인 버튼 클릭 시 AuthProvider의 signIn 메서드 호출
                  Provider.of<AuthProvider>(context, listen: false).logIn(
                    id: _idController.text,
                    password: _passwordController.text,
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            RichText(
                text: TextSpan(text: '회원가입',
                    style: TextStyle(
                      color: Colors.grey, // 회색
                      decoration: TextDecoration.underline, // 밑줄
                    ),
                    //import 'package:flutter/gestures.dart'; 위에 선언해야함
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => signup()))
                )
            ),
          ],
        ),
      ),
    );
  }
}

// nation dropdown
class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = nation_list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: nation_list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: nation_list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}



