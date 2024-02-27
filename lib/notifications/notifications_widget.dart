import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/custom_box_with_shadow.dart';
import 'package:pikem_nto/design/widgets/texts/custom_description_text.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_text.dart';
import 'package:pikem_nto/notifications/get_notifications.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomBoxWithShadow(
        width: MediaQuery.of(context).size.width,
        height: open?MediaQuery.of(context).size.height:200,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CustomTitleText(
                    text: 'Уведомления', 
                    size: 20,
                  ),
                  GestureDetector(
                    child: Icon(Icons.arrow_drop_down_sharp),
                  )
                ],
              ), 
              FutureBuilder<dynamic>(
                future: NotificationsRequests.getNotificationsList(),
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    if (snapshot.data.length != 0){
                      return Column();
                    }
                  }
                  return const Center(
                    child: CustomDescriptionTitleText(text: 'Нет данных'),
                    
                  );
                }
              ),
            ],
          ),
        )
      ),
    );
  }
}