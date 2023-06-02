import 'package:angel/editprofile/ui/editprofile.dart';
import 'package:angel/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../subscription/ui/subscription.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    profileBloc.add(ProfileInitialEvent());
    super.initState();
  }
  final ProfileBloc profileBloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listenWhen: (previous, current) => current is ProfileActionState,
      buildWhen: (previous, current) => current is! ProfileActionState,
      listener: (context, state) {
        if (state is NavigateToeditprofilePageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditProfile()));
        } else if (state is NavigatetoSubscriptionPageState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProfileLoadingState:
            return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ));
          case ProfileLoadedSuccessState:
            final successState = state as ProfileLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text('Happy Angels'),
                actions: [
                ],
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [ Row(
                        children: [
                          Image.network('https://img.icons8.com/color/48/membership-card.png', height: 200,),
                          Column(

                          ),
                        ],
                      ),
                        SizedBox(
                          height: 19,
                        ),
                        InkWell(
                          onTap: (){
                           profileBloc.add(NavigateToeditprofilePageEvent());
                          },
                          child: buildRow(
                              image: 'https://img.icons8.com/color/48/registration-skin-type-7.png', title: "Edit Profile"),
                        ),
                        SizedBox(
                          height: 19,
                        ),
                        buildRow(
                            image: 'https://img.icons8.com/color/48/membership-card.png',
                            title: "Subscription "),
                        SizedBox(
                          height: 19,
                        ),
                        buildRow(
                            image: 'https://img.icons8.com/color/48/angel-with-sword.png', title: "Assigned Angel"),
                        SizedBox(
                          height: 19,
                        ),
                        buildRow(
                            image: 'https://img.icons8.com/color/48/rating-circled.png',
                            title: "Points"),
                        SizedBox(
                          height: 19,
                        ),
                        buildRow(
                            image: 'https://img.icons8.com/color/48/medal.png',
                            title: "Awards"),
                        SizedBox(
                          height: 19,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );

          case ProfileErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}

Container buildRow({String? image, var title}) {
  return Container(
      alignment: Alignment.center,
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        //border: Border.all(width: 0.5, color: Color(0xff242424)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25,
          ),
        ],
      ),
      child: ListTile(
        minVerticalPadding: 25,
        leading: Image.network(
          image!, height: 50, width: 50,),
        title: Text(
          title, style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18,
        ),
        ),
      )
  );
}
