import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/authentication/controllers/add_post_offer/add_post_offer_controller.dart';

/// --- Engagement Bar For Owner --- ///
class TEngagementBarForOwner extends StatelessWidget {
  const TEngagementBarForOwner({
    super.key,
    required this.title,
    required this.user,
    required this.distanceString,
    required this.postId,
    required this.offerId,
    required this.userIdOfOffer,
    required this.userIdOfPost,
    required this.statusOfOffer,
  });

  final String title;
  final String user;
  final String distanceString;
  final String postId;
  final String offerId;
  final String userIdOfOffer;
  final String userIdOfPost;
  final String statusOfOffer;

  @override
  Widget build(BuildContext context) {
    final PostingController postingController = Get.put(PostingController());
    final ButtonStateController buttonStateController = Get.put(ButtonStateController());

    // Get the available width for the buttons
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = (screenWidth - 150) / 2; // Space for buttons to expand and show status

    return GestureDetector(
      onTap: () {
        // If tapping outside, reset the button states
        if (buttonStateController.isAcceptExpanded.value || buttonStateController.isDenyExpanded.value) {
          buttonStateController.resetButtons();
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                /// Name
                Text(
                  'by $user',
                  style: Theme.of(context).textTheme.bodySmall,
                ),

                /// Distance
                Text(
                  distanceString,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),

          /// Accept or deny offer buttons
          Row(
            children: [
              Obx(() => buttonStateController.showDenyButton.value
                  ? Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: buttonStateController.isDenyExpanded.value ? buttonWidth : 60.0,
                    height: 60.0,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (buttonStateController.isDenyExpanded.value) {
                          postingController.denyOffer(postId, offerId, userIdOfOffer);
                          buttonStateController.showDenyButton.value = false;
                          buttonStateController.showUndo.value = true;
                          buttonStateController.offerStatus.value = "Denied";
                        } else {
                          buttonStateController.isDenyExpanded.value = true;
                          buttonStateController.showAcceptButton.value = false;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        alignment: Alignment.center, // Align content to the left
                      ),
                      label: buttonStateController.isDenyExpanded.value
                          ? const Text("Deny")
                          : Container(),
                    ),
                  ),
                ],
              )
                  : Container()),
              const SizedBox(width: 6.0),
              Obx(() => buttonStateController.showAcceptButton.value
                  ? Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: buttonStateController.isAcceptExpanded.value ? buttonWidth : 60.0,
                    height: 60.0,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (buttonStateController.isAcceptExpanded.value) {
                          postingController.acceptOffer(postId, offerId, userIdOfOffer, userIdOfPost);
                          buttonStateController.showAcceptButton.value = false;
                          buttonStateController.showUndo.value = true;
                          buttonStateController.offerStatus.value = "Accepted";
                        } else {
                          buttonStateController.isAcceptExpanded.value = true;
                          buttonStateController.showDenyButton.value = false;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        alignment: Alignment.center, // Align content to the right
                      ),
                      label: buttonStateController.isAcceptExpanded.value
                          ? const Text("Accept")
                          : Container(),
                    ),
                  ),
                ],
              )
                  : Container()),
            ],
          ),
          Obx(() => buttonStateController.showUndo.value
              ? GestureDetector(
            onTap: () {
              buttonStateController.undoAction();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add padding for spacing
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      color: buttonStateController.offerStatus.value == "Accepted"
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      buttonStateController.offerStatus.value,
                      style: TextStyle(
                        color: buttonStateController.offerStatus.value == "Accepted"
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.blue.withOpacity(0.1),
                    child: const Icon(Icons.undo, color: Colors.blue, size: 16),
                  ),
                ],
              ),
            ),
          )
              : Container())
        ],
      ),
    );
  }
}

class ButtonStateController extends GetxController {
  var isAcceptExpanded = false.obs;
  var isDenyExpanded = false.obs;
  var showAcceptButton = true.obs;
  var showDenyButton = true.obs;
  var showUndo = false.obs;
  var offerStatus = ''.obs;

  void resetButtons() {
    isAcceptExpanded.value = false;
    isDenyExpanded.value = false;
    showAcceptButton.value = true;
    showDenyButton.value = true;
  }

  void undoAction() {
    showUndo.value = false;
    showAcceptButton.value = true;
    showDenyButton.value = true;
    offerStatus.value = '';
  }
}
