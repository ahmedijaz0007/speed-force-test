import 'package:flutter/material.dart';
import 'package:speedforcetest/constants/app_constants.dart';

class ProfileScreen extends StatelessWidget {
  final String? userName;
  final String? userEmail;
  final String? aboutMe;
  final String? earnings;
  final String? rating;
  final String? url;

  final List<ListTile>list = const [  ListTile(
    leading: Icon(Icons.pin_drop),
    title: Text("Business Location",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
  ),
    trailing: Icon(Icons.arrow_forward_ios_rounded),
  ),
    ListTile(
      leading: Icon(Icons.book_online_rounded),
      title: Text("Bookings",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    ),
    ListTile(
      leading: Icon(Icons.cases_sharp),
      title: Text("My Services",
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    ),];
  const ProfileScreen({super.key, this.userName, this.userEmail, this.aboutMe, this.earnings, this.rating, this.url});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Circular profile image
                  CircleAvatar(
                    radius: 60, // Adjust the size of the circle
                    backgroundImage: NetworkImage(
                      url ?? "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Replace with your image URL
                    ),
                  ),
                  SizedBox(height: 20),
                  // User name
                  Text(
                    userName ?? "John Doe",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  // User email
                  Text(
                    userEmail ?? "johndoe@gmai.com",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          boxShadow:
                          kElevationToShadow[2],
                          borderRadius: BorderRadius.circular(16)
      
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 5.0),
                          child: Column(
                            children: [
                              Text("Earnings"),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$$earnings",
                                style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            boxShadow:
                            kElevationToShadow[2],
                            borderRadius: BorderRadius.circular(16)
      
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 5.0),
                          child: Column(children: [
                            Text("Ratings"),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/images/png/star.png'),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  rating ?? "4.5",
                                  style: TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.w700),
                                ),
                              ],
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
      
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("About Me",
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                    ),
                          const SizedBox(),
                          Text(aboutMe ??"lorem Ipsum",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 16,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemCount: list.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return list[index];
                      }),
                ],
              ),
            ),
          ),
    );
  }
}
