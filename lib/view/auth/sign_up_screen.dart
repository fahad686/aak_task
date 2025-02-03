import 'package:akk_task/core/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/widgets/Custom_text_field.dart';
import '../../../../core/widgets/custom_button.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});
  static String route="/SignUpScreen";
  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {





  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child:Consumer(
        builder: ((context,ref,_)
    {
      var provider = ref.watch(authProvider);
      return
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: provider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(45),
                SizedBox(height: 60, child: Image.asset("assets/images/splash_logo.png",
                  fit: BoxFit.cover,)),
                const Gap(8),
                Text("welcome to",style:  Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
                const Gap(15),
                Text("Aak Science family ",style: Theme.of(context).textTheme.bodyMedium),
                const Gap(40),
                CustomTextFormField(title:"User Type*",controller: provider.userTypeController,),
                CustomTextFormField(title:"First Name*",controller: provider.fNameController,),
                CustomTextFormField(title:"Last Name*",controller: provider.lNameController,),
                CustomTextFormField(title:"Username*",controller: provider.userNameController,),
                CustomTextFormField(title:"Email*",controller: provider.emailController,textFormFieldType: TextFormFieldType.email),
                CustomTextFormField(title:"Password*",controller: provider.passwordController,textFormFieldType: TextFormFieldType.securedPassword,),
                CustomTextFormField(title:"Country*",controller: provider.countryController,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("ForgotPassword",style:  Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorConstants.primary),),
                  ],
                ),
                const Gap(30),




                CustomButton(
                  loader: provider.loading,
                  onPress: (){
                    if(provider.formKey.currentState!.validate()){
                      provider.signUp(
                        context,
                        userType: provider.userTypeController.text.trim(),
                        fName: provider.fNameController.text.trim(),
                        lName: provider.lNameController.text.trim(),
                        userName:provider. userNameController.text.trim(),
                        email: provider.emailController.text.trim(),
                        password:provider. passwordController.text.trim(),
                        country: provider.countryController.text.trim(),
                      );


                    }
                  },title: "SignUp",),
                const Gap(30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Account",style: Theme.of(context).textTheme.titleMedium),
                    const Gap(5),
                    GestureDetector(
                        onTap:(){
                        },
                        child: Text("login",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorConstants.primary))),
                  ],
                ),
                const Gap(25)
              ],
            ),
          ),
        );
    }),
        ) ,
      ),
    ));
  }
}




