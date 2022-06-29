import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:task1/modules/sign_up/sign_up_screen.dart';
import 'package:task1/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var numberController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 250.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cover.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Welcome to Fashion Daily',
                style: TextStyle(fontSize: 13.0, color: Colors.black87),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    saveAlert(context: context);
                  },
                  child: Row(
                    children: const [
                      Text(
                        'Help',
                        style: TextStyle(fontSize: 13.0, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      SizedBox(
                        height: 25.0,
                        width: 25.0,
                        child: Image(
                          image: AssetImage(
                            'assets/question_mark.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                )
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 13.0, color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CountryPickerDropdown(
                          initialValue: 'EG',
                          itemBuilder: _buildDropdownItem,
                          priorityList: [
                            CountryPickerUtils.getCountryByIsoCode('GB'),
                            CountryPickerUtils.getCountryByIsoCode('CN'),
                          ],
                          sortComparator: (Country a, Country b) =>
                              a.isoCode.compareTo(b.isoCode),
                          onValuePicked: (Country country) {
                            print(
                                "+${country.phoneCode + numberController.text} ");
                          },
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, left: 5.0),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                              controller: numberController,
                              keyboardType: TextInputType.number,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please input your Number';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white10,
                                hintText: 'Eg.84547126',
                                hintStyle: const TextStyle(
                                    color: Colors.black54, fontSize: 18.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                      width: 0.0, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {
                      navigateAndFinish(context, const LoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, right: 10.0, left: 10.0, bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        width: double.infinity,
                        height: 50.0,
                        child: const Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Or',
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateAndFinish(context, const LoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, right: 10.0, left: 10.0, bottom: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        width: double.infinity,
                        height: 50.0,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              height: 30.0,
                              width: 30.0,
                              child: Image(
                                image: AssetImage(
                                  'assets/google.png',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Sign with google',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Doesn\'t has any account?',
                    style: TextStyle(color: Colors.black, fontSize: 13.0),
                  ),
                  TextButton(
                    onPressed: () {
                      navigateAndFinish(context, const SignUpScreen());
                    },
                    child: const Text(
                      'Register here',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Use the application according to policy rules. Any',
                      style: TextStyle(color: Colors.black54, fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'kinds of voilations will be subject to sanctions',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12.0,
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

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );
}
