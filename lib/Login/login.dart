import 'package:flutter/material.dart';
import 'package:projetoprova/Telas/primeiraPagina.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    emailcontroller.text = "email@gmail.com";
    passwordcontroller.text = "senha";
    super.initState();
  }
  bool _showPassword = false;
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/cofre.png",
                      width: MediaQuery.of(context).size.width /3,
                    ),
                  ),
                  SizedBox(
                    height: 10 * 3,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Campo Obrigatório!";
                      }
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "email@gmail.com",
                      prefixIcon: Icon(Icons.email_outlined, color: Color.fromRGBO(57, 49, 153, 1),),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color:Color.fromRGBO(57, 49, 153, 1))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    validator: (String? cpf) {
                      if (cpf!.isEmpty) {
                        return "Campo obrigatório";
                      }},
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black,),
                    decoration: InputDecoration(
                      hintText: "Senha",
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(57, 49, 153, 1))),
                      prefixIcon: Icon(Icons.key, color: Color.fromRGBO(57, 49, 153, 1),),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          _showPassword == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color.fromRGBO(57, 49, 153, 1),
                        ),
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    obscureText: _showPassword == false ? true : false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 56,
                    child: ElevatedButton(
                    onPressed: _open,
                    child: _title(),
                    style: _style(),
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Não possui uma conta?" ,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){},
                    child: Text("Faça seu cadastro agora!", textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration:  TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(57, 49, 153, 1)
                      ),),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _title() => Text(
      "Entrar",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          color: Colors.white
      )
  );

  _style() => ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 2 , color: Colors.transparent)
          )
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }

        return Color.fromRGBO(57, 49, 153, 1); // Defer to the widget's default.
      }),
      elevation: MaterialStateProperty.all<double>(0)
  );



  _open() async {
    if(!_formkey.currentState!.validate()) return;

        Navigator.push(context, MaterialPageRoute(builder: (context) =>  FirstPage()));
  }


}
