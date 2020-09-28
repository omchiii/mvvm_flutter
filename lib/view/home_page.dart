import "package:flutter/material.dart";
import 'package:mvvm_provider/viewmodel/home_page_viewmodel.dart';
import "package:provider/provider.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (context) => HomePageViewModel(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Omer"),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Consumer<HomePageViewModel>(
                builder: (context, provider, child) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        onChanged: (val) {
                          provider.checkEmail(val);
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          errorText: provider.checkError(),
                        ),
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton.icon(
                        onPressed: provider.checkIsValid(),
                        color: Colors.blue[400],
                        disabledColor: Colors.grey,
                        icon: Icon(Icons.send),
                        label: Text("Send"),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
