import 'package:doctor_hunt/components/app_bar.dart';
import 'package:doctor_hunt/components/back_button.dart';
import 'package:doctor_hunt/themes/colors.dart';
import 'package:doctor_hunt/utils/constant.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorLivePage extends StatefulWidget {
  const DoctorLivePage({super.key});

  @override
  State<DoctorLivePage> createState() => _DoctorLivePageState();
}

class _DoctorLivePageState extends State<DoctorLivePage> {
  final _controller = TextEditingController();
  bool _emojiShowing = false;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/doc-2.jpg',
                width: screen.width,
                height: screen.height,
                fit: BoxFit.cover,
              ),
              Container(
                width: screen.width,
                height: screen.height,
                color: Colors.black.withOpacity(0.08),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screen.width,
                  height: screen.height * 0.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: SizedBox(
                  width: screen.width,
                  height: 72,
                  child: CustomAppBar(
                    prefix: const CustomBackButton(),
                    suffix: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/live-1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 84,
                child: SizedBox(
                  width: screen.width,
                  height: screen.height * 0.36,
                  child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      reverse: true,
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              image: DecorationImage(
                                image: AssetImage(comments[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            comments[index]['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              letterSpacing: -0.3,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            comments[index]['msg'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              letterSpacing: -0.3,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12)),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: screen.width,
                  height: 96,
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _controller,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: -0.3,
                      color: darkCharcoal,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 48),
                      prefixIcon: Container(
                        width: 44,
                        height: 44,
                        margin: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: green,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/chat_outlined.svg',
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(minWidth: 48),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: InkWell(
                            borderRadius: BorderRadius.circular(24),
                            onTap: () {
                              setState(() {
                                _emojiShowing = !_emojiShowing;
                              });
                            },
                            child: SvgPicture.asset('assets/icons/emoji.svg')),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Add a comment...',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: -0.3,
                        color: slateGray.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ),
              if (_emojiShowing)
                Positioned(
                  bottom: 96,
                  right: 20,
                  child: Container(
                    width: screen.width * .75,
                    height: screen.height * .25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: EmojiPicker(
                      textEditingController: _controller,
                      config: Config(
                        categoryViewConfig: CategoryViewConfig(
                          backgroundColor: green.withOpacity(.08),
                          iconColor: slateGray.withOpacity(.5),
                          iconColorSelected: green,
                          indicatorColor: green,
                          dividerColor: Colors.transparent,
                          backspaceColor: Colors.red,
                          categoryIcons: const CategoryIcons(
                            recentIcon: Icons.history_rounded,
                            smileyIcon: Icons.emoji_emotions_rounded,
                            foodIcon: Icons.fastfood_rounded,
                            animalIcon: Icons.pets_rounded,
                            activityIcon: Icons.directions_walk_rounded,
                            travelIcon: Icons.factory_rounded,
                            objectIcon: Icons.lightbulb_rounded,
                            symbolIcon: Icons.emoji_symbols_rounded,
                            flagIcon: Icons.flag_rounded,
                          ),
                        ),
                        bottomActionBarConfig:
                            const BottomActionBarConfig(enabled: false),
                        emojiTextStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: -0.3,
                          color: slateGray,
                        ),
                        emojiViewConfig: const EmojiViewConfig(
                          backgroundColor: Colors.white,
                          columns: 8,
                          emojiSizeMax: 32,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
