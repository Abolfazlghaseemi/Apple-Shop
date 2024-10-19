import 'package:ecommerce_project_main/bloc/authentication/auth_bloc.dart';
import 'package:ecommerce_project_main/bloc/authentication/auth_event.dart';
import 'package:ecommerce_project_main/bloc/authentication/auth_state.dart';
import 'package:ecommerce_project_main/constants/colors.dart';
import 'package:ecommerce_project_main/screens/RegisterScreen.dart';
import 'package:ecommerce_project_main/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _usernameTextController = TextEditingController(text: 'amirahmad');
  final _passwordTextController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: ViewContainer(
          usernameTextController: _usernameTextController,
          passwordTextController: _passwordTextController),
    );
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    super.key,
    required TextEditingController usernameTextController,
    required TextEditingController passwordTextController,
  })  : _usernameTextController = usernameTextController,
        _passwordTextController = passwordTextController;

  final TextEditingController _usernameTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomColors.blue,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon_application.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'اپل شاپ ',
                      style: TextStyle(
                          fontFamily: 'sb', fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller: _usernameTextController,
                      decoration: InputDecoration(
                        labelText: 'نام کاربری',
                        labelStyle: TextStyle(
                            fontFamily: 'sb',
                            fontSize: 20,
                            color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide:
                              BorderSide(color: CustomColors.blue, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordTextController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'رمز عبور',
                        labelStyle: TextStyle(
                            fontFamily: 'sb',
                            fontSize: 20,
                            color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide:
                              BorderSide(color: CustomColors.blue, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocConsumer<AuthBloc, AuthState>(
                        listener: ((context, state) {
                      if (state is AuthResponseState) {
                        state.reponse.fold((l) {
                          _usernameTextController.text = '';
                          _passwordTextController.text = '';
                          var snackbar = SnackBar(
                            content: Text(
                              l,
                              style:
                                  TextStyle(fontFamily: 'dana', fontSize: 14),
                            ),
                            backgroundColor: Colors.black,
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 5),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }, (r) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen()));
                        });
                      }
                    }), builder: ((context, state) {
                      if (state is AuthInitiateState) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle:
                                  TextStyle(fontFamily: 'dana', fontSize: 20),
                              backgroundColor: Colors.blue,
                              minimumSize: Size(200, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              )),
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context).add(
                                AuthLoginRequest(_usernameTextController.text,
                                    _passwordTextController.text));
                          },
                          child: Text(
                            'ورود به حساب کاربری',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      if (state is AuthLoadingState) {
                        return CircularProgressIndicator(
                          color: CustomColors.blue,
                        );
                      }

                      if (state is AuthResponseState) {
                        Widget widget = Text('');
                        state.reponse.fold((l) {
                          widget = ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                  fontFamily: 'dana',
                                  fontSize: 20,
                                  color: Colors.white),
                              backgroundColor: Colors.blue,
                              minimumSize: Size(200, 48),
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                  AuthLoginRequest(_usernameTextController.text,
                                      _passwordTextController.text));
                            },
                            child: Text(
                              'ورود به حساب کاربری',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }, (r) {
                          widget = Text(r);
                        });
                        return widget;
                      }
                      return Text('خطای نا مشخص !');
                    })),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return RegisterScreen();
                        }));
                      },
                      child: Text(
                        'اگر حساب کاربری ندارید ثبت نام کنید',
                        style: TextStyle(
                            fontFamily: 'dana',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
