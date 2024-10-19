import 'package:ecommerce_project_main/bloc/authentication/auth_bloc.dart';
import 'package:ecommerce_project_main/bloc/authentication/auth_event.dart';
import 'package:ecommerce_project_main/bloc/authentication/auth_state.dart';
import 'package:ecommerce_project_main/constants/colors.dart';
import 'package:ecommerce_project_main/screens/login_screen.dart';
import 'package:ecommerce_project_main/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _usernameTextController =
      TextEditingController(text: 'amirahmadaban31');
  final _passwordTextController = TextEditingController(text: '12345678');
  final _passwordConfirmTextController =
      TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: ViewContainer(
            usernameTextController: _usernameTextController,
            passwordTextController: _passwordTextController,
            passwordConfirmTextController: _passwordConfirmTextController));
  }
}

class ViewContainer extends StatelessWidget {
  const ViewContainer({
    super.key,
    required TextEditingController usernameTextController,
    required TextEditingController passwordTextController,
    required TextEditingController passwordConfirmTextController,
  })  : _usernameTextController = usernameTextController,
        _passwordTextController = passwordTextController,
        _passwordConfirmTextController = passwordConfirmTextController;

  final TextEditingController _usernameTextController;
  final TextEditingController _passwordTextController;
  final TextEditingController _passwordConfirmTextController;

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
                    TextField(
                      controller: _passwordConfirmTextController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: 'تکرار رمز عبور',
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
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          }, (r) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailScreen()));
                          });
                        }
                      }),
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return CircularProgressIndicator(
                            color: CustomColors.blue,
                          );
                        }

                        if (state is AuthInitiateState ||
                            state is AuthResponseState) {
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
                              ),
                            ),
                            onPressed: () {
                              if (_usernameTextController.text.isEmpty ||
                                  _passwordTextController.text.isEmpty ||
                                  _passwordConfirmTextController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('تمام فیلدها را پر کنید'),
                                  ),
                                );
                                return;
                              }

                              if (_passwordTextController.text !=
                                  _passwordConfirmTextController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('رمزهای عبور مطابقت ندارند'),
                                  ),
                                );
                                return;
                              }

                              BlocProvider.of<AuthBloc>(context).add(
                                  AuthRegisterRequest(
                                      _usernameTextController.text,
                                      _passwordTextController.text,
                                      _passwordConfirmTextController.text));
                            },
                            child: Text(
                              'ثبت نام',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }

                        return Text('خطای نا مشخص !');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Text(
                        'اگر حساب کاربری دارید وارد شوید',
                        style: TextStyle(
                            fontFamily: 'dana',
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
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
