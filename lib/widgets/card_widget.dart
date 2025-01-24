import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedforcetest/constants/app_constants.dart';

class CardWidget extends StatelessWidget{
  final String? url;
  final String? earnings;
  final String? name;

  const CardWidget({super.key,  this.url,  this.earnings,  this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      height: 300,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text("Hello!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 24,color: Colors.white)),
                      const SizedBox(width: 4,),
                      Text(name ?? "User",style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 24,color: Colors.white),)
                    ],
                  ),
                  ClipOval(
                    child: Image.network(
                      url ??"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      height: 50.0,
                      width: 50.0,
                      fit:BoxFit.cover, //change image fill type
                    ),
                  )
                //  ClipRRect(child: CircleAvatar(child: Image.network(fit: BoxFit.fill,url ??"https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),)),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(
                boxShadow:  [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // Shadow color with opacity
                    spreadRadius: 0, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: const Offset(0, 2), // Shadow position (x, y)
                  ),
                ],
              ),
              child: Stack(
                children: [

                  Positioned(child: Image.asset("assets/images/png/white_card.png")),
                  const Positioned(top:20,left: 20,child: Text("My Earnings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),)),
                   Positioned(top:47,left: 20,child: Text(earnings ??"0",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.primaryColor),)),

                  Positioned(top: 0,bottom: 4,right: -10,child: Image.asset("assets/images/png/person.png")),
                  Positioned(left:0,bottom: 0,child: Image.asset("assets/images/png/red.png")),
                  Positioned(left:10,bottom: 20,child:  ElevatedButton(onPressed: (){}, child: const Text("Details",style: TextStyle(fontSize: 12),)),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}