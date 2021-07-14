import 'package:flutter/material.dart';

dynamic modalBottomSheet(context, snapshot, i) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(50.0))),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(snapshot.data![i].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Divider(),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        Row(
                          children: [
                            Text('Email:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              snapshot.data![i].email,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        Row(
                          children: [
                            Text('Username:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              snapshot.data![i].username,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Phone:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),
                                  Text(snapshot.data![i].phone),
                                ]),
                          ],
                        ),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Website:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0)),
                                  Text(snapshot.data![i].website),
                                ]),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
