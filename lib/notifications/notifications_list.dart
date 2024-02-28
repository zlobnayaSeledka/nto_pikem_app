import 'package:flutter/material.dart';
import 'package:pikem_nto/design/widgets/custom_box_with_shadow.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_description_text.dart';
import 'package:pikem_nto/design/widgets/texts/custom_title_text.dart';
import 'package:pikem_nto/notifications/get_notifications.dart';
import 'package:pikem_nto/notifications/notification_widget.dart';

class NotificationsList extends StatefulWidget {
  const NotificationsList({super.key});

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  bool open = false;
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomBoxWithShadow(
        width: MediaQuery.of(context).size.width,
        height: open?MediaQuery.of(context).size.height:200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10.0),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  const CustomTitleText(
                    text: 'Уведомления', 
                    size: 25,
                  ),
                  GestureDetector(
                    child: Icon(open?Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_sharp),
                    onTap:(){
                      setState(() {
                        open = !open;
                      });
                    }
                  )
                ],
              ), 
              const SizedBox(height: 20),
              FutureBuilder<dynamic>(
                future: NotificationsRequests.getNotificationsList(),
                builder: (context, snapshot){
                  if (snapshot.hasData){
                    if (snapshot.data.length != 0){
                      return SizedBox(
                        height: (open?MediaQuery.of(context).size.height:200)-70,
                        child: ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                              child: NotificationWidget(
                                notificationName: snapshot.data[index]['type'], 
                                time: snapshot.data[index]['time']
                              ),
                            );
                          })
                        ),
                      );
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