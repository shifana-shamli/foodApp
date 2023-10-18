import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loginpage/service/api_service.dart';
import 'package:loginpage/utils/app_sp.dart';
import 'package:loginpage/view/widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_constant.dart';
import '../../widgets/app_text_filed.dart';
import '../../widgets/app_text_view.dart';
import '../login_us/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late LoginBloc loginBloc;

  // String email="";
  // String password="";


  // shared preference storing
  void loginSave()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('email', phoneController.text);
    await preferences.setString('password', passwordController.text);
    await preferences.setBool('isLoggedIn', true);
  }

  //shared preference data load
  // void loadData()async{
  //   SharedPreferences preferences= await SharedPreferences.getInstance();
  //   setState(() {
  //     email = preferences.getString('email')??'';
  //     password = preferences.getString('password')??'';
  //   });
  //   if (isLoggedIn){
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
  //   }
  // }

  @override
  void initState() {
    loginBloc=LoginBloc(RepositoryProvider.of<APIService>(context));

    super.initState();
  }
 // late  LoginBloc loginBloc;
  bool   obscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => loginBloc,
  child: Scaffold(
      appBar: AppBar(
       title:  appTextView(name: 'LOGIN PAGE'),
        centerTitle: true,
        backgroundColor: AppColor.greenAccent,
        leading: const Icon(
          Icons.arrow_back,
          color: AppColor .white,
        ),
      ),
      body:  Padding(
        padding:  commonPaddingAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appTextFiled( phoneController,const Icon(Icons.phone),labelText: "enter the number",inputType: TextInputType.phone),
            dividerH(),
            appTextFiled(
                passwordController,IconButton(onPressed: (){
              setState(() {
                obscureText=!obscureText;
              });
            }, icon: Icon( obscureText ?Icons.visibility_off:Icons.visibility),),labelText: "enter the password",obscureText: obscureText),
            dividerH(),
            BlocConsumer< LoginBloc, LoginState>(
         listener: (context, state) {
           if(state is LoginSuccessState){
            if(state.response.status=="success"){
              EasyLoading.showToast("${state.response.message}");
              AppSp().setIsLogged(true);
              Navigator.pushNamed(context, "/home");


            }else{

                EasyLoading.showToast("${state.response.message}");


            }


           }


           },
         builder: (context, state) {
          return appButton((){

            loginBloc.add(LoginApiEvent(phoneController.text.toString(),  passwordController.text.toString()));
            }, context,buttonColor: AppColor.greenAccent,name: "login");
  },
),


          ],

        ),
      ),

    ),
);
  }
}


bool isLoggedIn=false;