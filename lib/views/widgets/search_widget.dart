import 'dart:convert';

import 'package:cab_user/controller/navigation/map_controller.dart';
import 'package:cab_user/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget searchListView(
    // List responses,
    // bool isResponseForDestination,
    TextEditingController destinationController,
    TextEditingController sourceController) {
  return GetBuilder<mapController>(builder: (controller) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.response.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                String text = controller.response[index]['place'];
                print(controller.response[index]['location']);
                if (controller.isDestination == true) {
                  print("is working");
                  sourceController.text = text;
                  controller.pickupGetting(index);
                  controller.pickupSetting(index);
                 
                } else {
                  print("its else case");
                  destinationController.text = text;

                  controller.destinationGetting(index);
                  controller.destinationSetting(index);

                 
                }
                FocusManager.instance.primaryFocus?.unfocus();
              },
              leading: const SizedBox(
                height: double.infinity,
                child: CircleAvatar(child: Icon(Icons.map)),
              ),
              title: Text(controller.response[index]['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(controller.response[index]['address'],
                  overflow: TextOverflow.ellipsis),
            ),
            const Divider(),
          ],
        );
      },
    );
  });
}
