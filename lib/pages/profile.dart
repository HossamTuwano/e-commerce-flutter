import "package:flutter/material.dart";

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: const Color(0xffF4F4F4),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(
                            color: Colors.white,
                            width: 7,
                          )),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('assets/avatars/2.jpg'),
                        radius: 60,
                      ),
                    ),
                  ),
                  const Text(
                    'Tim Cook',
                    style: TextStyle(
                        color: Color(0xff242424),
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        fontFamily: 'Poppins'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 360,
                          child: const Text(
                            '"I love to buy vinyl records, iPads, and other tech gadgets!"',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff242424),
                                letterSpacing: 2),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('assets/icons/hearticon.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Favourites',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('assets/icons/checkicon.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'To Buy',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset('assets/icons/carticon.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Purchases',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: Divider(
                      height: 10,
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 8.0),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  primary: const Color(0xffE10000),
                ),
                onPressed: () {},
                child: Text(
                  'logout'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                )),
          ),
        ),
      ],
    );
  }
}
