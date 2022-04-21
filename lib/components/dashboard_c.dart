import 'package:student_id/all_export.dart';
import 'package:student_id/components/text_c.dart';

class RowText extends StatelessWidget{

  final Decoration? decoration;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  RowText({
    this.decoration, 
    this.leading, 
    this.trailing, 
    this.padding = const EdgeInsets.all(15), 
    this.margin, 
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center
  });

  @override
  Widget build(BuildContext context){
    return Container(
      margin: margin,
      decoration: decoration,
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment!,
        crossAxisAlignment: crossAxisAlignment!,
        children: [
          leading!,
          Expanded(child: Container()),
          trailing!
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget{

  final Decoration? decoration;
  final Widget? leading;
  final String? title;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final Function()? action;
  final Color? titleColor;

  MyListTile({
    this.decoration, 
    this.title, 
    this.leading,
    this.trailing, 
    this.padding = const EdgeInsets.all(15), 
    this.margin = const EdgeInsets.only(left: 20, right: 20, bottom: 20),
    this.height,
    this.action,
    this.titleColor
  });

  Widget build(BuildContext context){
    return InkWell(
      onTap: action,
      child: Column(
        children: [
          Container(
            margin: margin,
            decoration: decoration == null ? BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white
            ) : decoration,
            padding: padding,
            height: height,
            child: Row(
              children: [
                leading == null ? Container() : SizedBox(
                  width: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: leading!
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: MyText(
                      textAlign: TextAlign.left,
                      text: title ?? "",
                      fontSize: 15,
                      color2: titleColor == null ? Colors.black.withOpacity(0.5) : titleColor!,
                    )
                  )
                ),
                trailing ?? Container()
              ],
            ),
          ),

          Divider(
            thickness: 1,
            height: 0.2,
          )
        ]
      ),
    );
  }
}