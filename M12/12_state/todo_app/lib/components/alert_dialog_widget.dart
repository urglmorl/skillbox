import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    Key key,
    this.onYes,
    this.onNo,
  }) : super(key: key);

  final VoidCallback onYes;
  final VoidCallback onNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Вы уверены что хотите удалить задачу?'),
      actions: [
        FlatButton(
          child: Text('Нет'),
          onPressed: () {
            onNo.call();
          },
        ),
        FlatButton(
          child: Text('Да'),
          onPressed: () {
            onYes.call();
          },
        ),
      ],
    );
  }
}
