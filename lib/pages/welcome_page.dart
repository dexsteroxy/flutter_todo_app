import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Todos",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                ),

                SizedBox(height: 60),

                SizedBox(
                  
                  child: Image(image: AssetImage('assets/welcome.jpeg')),
                ),
                SizedBox(height: 14),

                Text(
                  "This Great Todo App is designed and created by SIXTUS AMADI to help user set there goal and to work toward there goal. ", textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      
                      onPressed: () {
                        Navigator.pushNamed(context, '/all_folders');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal
                      ),
                      child: Text("Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),),
                      
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
