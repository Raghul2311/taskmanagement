import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmangament/utils/appcolors.dart';
import 'package:taskmangament/views/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // default height and width.................
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // controller for text field........

    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    final TextEditingController emailcontroller = TextEditingController();

    // Global key for form...........

    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: formkey,
        child: Row(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth * 0.4,
              decoration: BoxDecoration(color: AppsColors.green),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "welcome Back!",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),

                    Text(
                      "To keep contected with as please",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "login with your personal info",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                        padding: EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 20,
                        ),
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Right side - Create Account
            SizedBox(
              width: screenWidth * 0.6,
              height: screenHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        color: AppsColors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                offset: Offset(0, 3),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/google.png",
                              height: 20,
                              width: 20,
                              color: Colors.black,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),

                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                offset: Offset(0, 3),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/linkedin.png",
                              height: 20,
                              width: 20,
                              color: Colors.black,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),

                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                offset: Offset(0, 3),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.facebook_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      "or use your email for your Registration",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                          size: 20,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: AppsColors.green,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
