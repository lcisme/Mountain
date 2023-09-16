
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripsmountain/core/constant/dimension_constant.dart';
import 'package:tripsmountain/widgets/app_text.dart';
import 'package:tripsmountain/widgets/item_button_widget.dart';

import '../custom/button_custom.dart';
import 'checkout_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _TextPageState();
}
class _TextPageState extends State<DetailPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome-1.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              Positioned(
                  top: 20,
                  left: 20,
                  child:GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefaultPadding,
                        ),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        size: kDefaultPadding,
                        color: Colors.black,
                      ),
                    ),
                  )
              ),
              Positioned(
                  top: 100,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: kDefaultPadding * 1.5, right: kDefaultPadding * 1.5),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height-180,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(kDefaultPadding * 3), topLeft: Radius.circular(kDefaultPadding * 3)),
                          color: Colors.white
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: kDefaultPadding * 2,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  AppText(text: "Old Trafford", fontWeight: FontWeight.bold, size: 25,),
                                  AppText(text: "\$123", size: 20, color: Colors.blue,)
                                ],
                              ),
                              const SizedBox(height: 6,),
                              Row(
                                children: [
                                  const Icon(FontAwesomeIcons.locationDot, size: 15, color: Colors.grey,),
                                  const SizedBox(width: 6,),
                                  AppText(text: "England", color: Colors.grey,)
                                ],
                              ),
                              const SizedBox(height: 6,),
                              Row(
                                children: [
                                  Wrap(
                                    children: List.generate(5, (index) {
                                      return Icon(Icons.star, color: (index < 3)? Colors.orange : Colors.grey,);
                                    }),
                                  ),
                                    const SizedBox(width: 6,),
                                    AppText(text: "(3})", color: Colors.grey,)
                                ],
                              ),
                              const SizedBox(height: 20,),
                              AppText(text: "Description", fontWeight: FontWeight.bold, size: 25,),
                              const SizedBox(height: 10,),
                              AppText(text: "Thành phố hỗ trợ đối với sinh viên, công nhân, người"
                                  " lao động thuê (hoặc ở ghép tại căn hộ) hỗ trợ mỗi cá nhân 1,5 "
                                  "triệu/người/tháng trong 6 tháng; hỗ trợ toàn bộ chi phí tại bệnh"
                                  " viện đối với người bị thương trong vụ hỏa hoạn phải điều trị tạ"
                                  "i bệnh viện; hỗ trợ tiền mua sách vở, đồ dùng học tập đối với trẻ "
                                  "em của các gia đình trong vụ hỏa hoạn, mức 5 triệu đồng/trẻ. Đồng "
                                  "thời, giao chính quyền địa phương có biện pháp hỗ trợ ổn định chỗ "
                                  "ở, các điều kiện sinh hoạt thiết yếu đảm bảo cuộc sống cho người "
                                  "dân để cuộc sống sớm trở lại bình thường.",
                              color: Colors.grey,size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Positioned(
                  bottom: 2,
                  child: Container(
                    padding: const EdgeInsets.only(left: kDefaultPadding * 1.5, right: kDefaultPadding * 1.5),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {

                            });
                          },
                            child: ButtonCustom(
                             isIcon: true,
                             height: 50,
                             icon: const Icon(
                              FontAwesomeIcons.solidHeart,color: Colors.red,
                             ),
                             backgroundColor: Colors.transparent,
                             borderColor: Colors.grey,
                           ),
                        ),
                        Spacer(),
                        ItemButtonWidget(
                          data: "Book trip now",
                          width: 270,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute (builder: (context) => const CheckOutPage())
                            );
                          },
                        ),
                      ],
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
