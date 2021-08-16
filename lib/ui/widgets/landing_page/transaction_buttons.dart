import 'package:flutter/material.dart';

class TransactionButton extends StatelessWidget {
  const TransactionButton({Key key, this.icon, this.onClick, this.text})
      : super(key: key);
  final IconData icon;
  final String text;
  final Function onClick;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [Icon(icon),SizedBox(height: 2,), Text(text)],
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side:
                                        BorderSide(color: Colors.deepPurple))),
        ));
  }
}
