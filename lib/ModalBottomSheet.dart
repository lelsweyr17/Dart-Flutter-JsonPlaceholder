import 'dart:async';

import 'package:flutter/material.dart';

Future modalBottomSheet(context, snapshot) async {

  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100.0))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 75.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text('test',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          children: [Text('test')],
                        ),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        Row(
                          children: [Text('test')],
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
