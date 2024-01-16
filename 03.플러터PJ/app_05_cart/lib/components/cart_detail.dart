// 카트 페이지 상세구성 클래스
// 버튼 클릭시 변경되는 변수값에 따라
// 이미지와 정보표시가 업데이트 되는 상태변경 위젯인
// stateful 위젯으로 구성한다

import 'package:app_05_cart/constants.dart';
import 'package:flutter/material.dart';

// 상태관리 위젯 상속한 메인 클래스 //////////
class CartDetail extends StatefulWidget {
  const CartDetail({Key? key}) : super(key: key);

  @override
  State<CartDetail> createState() => _CartDetailState();
} //// cart ///////////////////////////

// 상태관리 에서 변경부분 반영을 위한 build 메서드를
// 분리하여 반영하는 서브클래스

class _CartDetailState extends State<CartDetail> {
// 선택된 버튼 순번을 지정하는 변수
  int sequenceNum = 0;

// 일반값 세팅변수

// 이미지 리스트
  List<String> selectedPic = [
    "assets/p1.jpeg",
    "assets/p2.jpeg",
    "assets/p3.jpeg",
    "assets/p4.jpeg",
  ];

  // 상품명 리스트
  List<String> selectedTit = [
    "Living bicycle",
    "Honda motorcycle",
    "Tesla Model3",
    "Cessna 150",
  ];
  // 상품가격 리스트 [ 가격, 조회수 ]
  Map<String, List> selectedPrice = {
    "Living bicycle": [699, 26, 5],
    "Honda motorcycle": [1700, 35, 8],
    "Tesla Model3": [7800, 98, 9],
    "Cessna 150": [12400, 75, 6],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1.상품이미지 : _buildPicture()
        _buildPicture(),
        // 2.선택버튼 :
        // 3.상품정보 : 상품명 + 리뷰수 + 상품가격 + 별점 + 리뷰수 + 버튼
      ],
    );
  }

// 1. 상품이미지 생성 매서드
  Widget _buildPicture() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          // 비율유지 박스내에 이미지를 넣는다
          AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          // 위에 셋팅된 이미지를 호출
          selectedPic[sequenceNum],
          // 비율박스 이미지 맞게 채움
          fit: BoxFit.cover,
        ),
      ),
    );
  } //// _buildPicture ////////////////

// 2.선택버튼 생성매서드
  Widget _buildSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [],
      ),
    );
  } //////////////////////////////

  /// 선택버튼만들기 메서드
  Widget _buildSelectButton(int seq, IconData mIcon) {
    // seq변수 : 버튼 클릭시 변경할 순번변수값 세팅
    // mIcon : 버튼 아이콘
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        // 버튼 배경색상은 선택된것과 일반적인것으로 구분
        // 현재 버튼하고 선택버튼 순번과 같으면 엑센트색 넣기
        color: seq == sequenceNum ? kAccentColor : kSecondaryColor,
        // 둥근 모서리 셋팅
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(mIcon, color: Colors.black),
        onPressed: () {
          // 상태변수 변수값 업데이트
          setState(() {
            sequenceNum = seq;
          });
        },
      ),
    );
  } ////////////  _buildSelectButton
} /////// _CartDetailState ///////////
