// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:reels_viewer/src/dropdown.dart';
import 'package:reels_viewer/src/models/reel_model.dart';
import 'package:reels_viewer/src/reels_page.dart';

class ReelsViewer extends StatefulWidget {
  final List<ReelModel> reelsList;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function(int)? onIndexChanged;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;
  final String? appbarTitle;
  final bool showAppbar;
  final bool showProgressIndicator;
  final Function()? onClickBackArrow;

  const ReelsViewer({
    Key? key,
    required this.reelsList,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
    this.appbarTitle,
    this.showAppbar = true,
    this.onClickBackArrow,
    this.onIndexChanged,
    this.showProgressIndicator = true,
  }) : super(key: key);

  @override
  State<ReelsViewer> createState() => _ReelsViewerState();
}

class _ReelsViewerState extends State<ReelsViewer> {
  SwiperController controller = SwiperController();
  int currentIndex = 0;
  bool isDropdownOpen = false;
  final List<DropdownItem> dropdownItems = [
    DropdownItem(text: 'Following', icon: Icons.people),
    DropdownItem(text: 'Nearby', icon: Icons.location_on),
    DropdownItem(text: 'Notes', icon: Icons.cloud),
  ];

  void toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  void closeDropdown() {
    if (isDropdownOpen) {
      setState(() {
        isDropdownOpen = false;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
          onTap: closeDropdown,
          child: Stack(
            children: [
              // Swiper for reel content
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ReelsPage(
                    item: widget.reelsList[index],
                    onClickMoreBtn: widget.onClickMoreBtn,
                    onComment: widget.onComment,
                    onFollow: widget.onFollow,
                    onLike: widget.onLike,
                    onShare: widget.onShare,
                    showVerifiedTick: widget.showVerifiedTick,
                    swiperController: controller,
                    showProgressIndicator: widget.showProgressIndicator,
                  );
                },
                controller: controller,
                itemCount: widget.reelsList.length,
                scrollDirection: Axis.vertical,
                onIndexChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                  if (widget.onIndexChanged != null) {
                    widget.onIndexChanged!(index);
                  }
                },
              ),
              if (widget.showAppbar)
                Positioned(
                  top: 8,
                  left: 8,
                  right: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title with dropdown arrow
                      if (currentIndex == 0)
                        Row(
                          children: [
                            Text(
                              widget.appbarTitle ?? 'Reels',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: (isDropdownOpen)
                                  ? closeDropdown
                                  : toggleDropdown,
                              child: Icon(
                                isDropdownOpen
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(width: 0),

                      IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          print("Camera icon pressed");
                        },
                      ),
                    ],
                  ),
                ),
              if (isDropdownOpen)
                Positioned(
                  top:
                      50, // Adjust position as needed to fit under appbar title
                  left: 10,
                  child: GestureDetector(
                    onTap:
                        () {}, // Stops onTap from propagating to close dropdown
                    child: Container(
                      width: 130,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(221, 29, 28, 28),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: dropdownItems.map((item) {
                          return DropdownItemWidget(
                            text: item.text,
                            icon: item.icon,
                            onTap: () {
                              toggleDropdown();
                              // Handle item tap here, if needed
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
