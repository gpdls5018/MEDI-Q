<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">
</head>
<style>
    .effect-custom-font {
      font-family : Noto Sans KR, sans-serif;
    }
    .check-take-time-tag {
      color:#9e9e9e;
      background-color: white;

    }
    .check-take-time-tags span:hover {
      color:#ff4b4b;
      background-color:#ffdcdc;
    }
    .check-take-time-tag-select {
      color:#ff4b4b;
      background-color:#ffdcdc;
    }

    .bi-star-fill{
        font-size: 40px;
        line-height: 40px;
        color: #fff236;
        
    }
    .bi-star {
      font-size: 40px;
      line-height: 40px;
    }
    .bi-star:hover {
      font-size: 40px;
        line-height: 40px;
        color: #fff236;
    }

</style>
<body>
  <div class="container">
    헤더
    <hr>
    <div class="food jumbotron d-flex" style="border-radius: 20px;">
      <img src="<c:url value="resources/images/noPhoto.jpg"/>" style="border-radius: 20px;width:400px;"/>
      <div class="food-text m-auto effect-custom-font" style="font-size: 25px;">
        <div class="food-company">회사명</div>
        <div class="food-title">고려은단 비타민 1000C</div>
      </div>
    </div>
    <div class="check-take-time effect-custom-font ">
      <div style="font-size: 30px;">영양제를 얼마나 드셨나요?</div>
      <div class="check-take-time-tags d-flex m-3">
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">1개월 미만</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">1~3개월</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">3~6개월</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">6개월~1년</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">1년 이상</span>
      </div>
    </div>
    <div class="check-rating effect-custom-font mt-5">
      <div style="font-size: 30px;">영양제에 만족하셨나요?</div>
      <div class="check-rating-stars m-3">
        <i class="bi bi-star check-rating-star"></i>
        <i class="bi bi-star check-rating-star"></i>
        <i class="bi bi-star check-rating-star"></i>
        <i class="bi bi-star check-rating-star"></i>
        <i class="bi bi-star check-rating-star"></i>
      </div>
    </div>
    <div class="check-rating effect-custom-font mt-5">
      <div style="font-size: 30px;">이 영양제를 먹고 일반적으로 느끼는 효과예요. 어떤 효과를 느꼈나요?</div>
      <div class="mt-3" style="font-size: 20px;color: #9e9e9e;">가장 많이 느낀 효과를 선택해 주세요. (최대 5개)<br>
        원하는 효과가 없을 경우 텍스트 후기에 남겨주세요!
      </div>
      <div class="check-take-time-tags d-flex m-3">
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">효과가 없었어요</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">감기 덜 걸림</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">구내염 개선</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">피로 개선</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">피부상태 개선</span>
      </div>
    </div>
    <div class="check-rating effect-custom-font mt-5">
      <div style="font-size: 30px;">어떤 부작용이 있었나요?</div>
      <div class="mt-3" style="font-size: 20px;color: #9e9e9e;">가장 많이 느낀 부작용을 선택해 주세요. (최대 5개)<br></div>
      <div class="check-take-time-tags d-flex m-3">
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">부작용이 없었어요</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">변비</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">설사</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">어지러움</span>
        <span class="check-take-time-tag p-2 m-1" style="border:solid 3px #dbdbdb;border-radius: 15px;font-size:20px;">두통</span>
      </div>
    </div>
    <div class="check-rating effect-custom-font mt-5">
      <div style="font-size: 30px;">영양제에 대한 상세한 후기를 들려주세요!</div>
      <textarea class="mt-3 jumbotron" style="width: 100%;border:solid 3px #dbdbdb;border-radius: 20px;" placeholder="영양제에 대한 솔직한 리뷰를 남겨주세요."></textarea>
    </div>
  </div>



  <script>
    $('.check-take-time-tags').children().click(function() {
      console.log($(this).html());
      $(this).toggleClass('check-take-time-tag-select');
    });

    $('.check-rating-star').click(function(e) {
      $('.check-rating-star').removeClass("bi-star-fill").addClass("bi-star");
        for(var i=0;i<=$(this).index();i++) {
          $('.check-rating-star').eq(i).removeClass("bi-star").addClass("bi-star-fill");
        }
    });
    

  </script>
</body>
</html>