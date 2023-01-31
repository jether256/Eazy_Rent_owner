import 'package:flutter/material.dart';


class ForgetPasswordMail extends StatefulWidget {
  const ForgetPasswordMail({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordMail> createState() => _ForgetPasswordMailState();
}

class _ForgetPasswordMailState extends State<ForgetPasswordMail> {
  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40,right: 20,left: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //image section
                Image.asset('assets/images/logo.png',height: size.height * 0.2),
                const Text('Forget Password,',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                const Text('Find the Best Houses for rent,Just Login',style: TextStyle(color: Colors.white,fontSize: 14),),


                //form
                Card(
                  color: Colors.grey[100],
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        child:Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              TextFormField(
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email_outlined),
                                    labelText: 'Email',
                                    hintText: 'Email',
                                    border: OutlineInputBorder()
                                ),
                              ),

                              const SizedBox(height: 20,),

                              SizedBox(
                                width:double.infinity,
                                child: ElevatedButton(
                                    onPressed:(){},
                                    child: Text('Next'.toUpperCase(),style: TextStyle(color: Colors.white),)
                                ),
                              ),
                              const SizedBox(height: 20,),
                            ],
                          ),
                        )
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
