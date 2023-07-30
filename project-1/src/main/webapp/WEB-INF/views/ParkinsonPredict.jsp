<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/tsfolder/css/drawStyle.css"/>" rel="stylesheet">
    <title>Painting</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
<canvas id="jsCanvas" class="canvas"></canvas>
<div class="controls">
    <div class="controls__btns">
        <button id="jsSave">Save</button>
    </div>
    <div id="image-container"></div>
</div>

</body>
<script>
    function handleSaveClick() {
        const files = canvas.toDataURL("image/png");
        const imageData = files.split(",")[1]; // "data:image/png;base64," 이후의 이미지 데이터
        const filedata = { base64String : imageData };
        const formData = new FormData(); // AJAX로 파일 업로드시 사용
        formData.append("files", imageData);

// FormData의 값을 콘솔에 출력
        for (const entry of formData.entries()) {
            console.log(entry[0], entry[1]);
        }

        $.ajax({
            url: "http://192.168.0.16/parkinson",
            data: filedata,
            method: "post"
        }).done(function(response) {
        	// 받아온 이미지 base64 데이터
        	console.log(response.score);
            var imageBase64 = response.image_base64;

            // 이미지 생성 및 화면에 출력
            var imageTag = '<img src="data:image/png;base64,' + imageBase64 + '" alt="Image">';
            $('#image-container').html(imageTag);
        });
    }
    const canvas = document.getElementById("jsCanvas");
    const ctx = canvas.getContext("2d");
    const colors = document.getElementsByClassName("jsColor");
    const range = document.getElementById("jsRange");
    const mode = document.getElementById("jsMode");
    const saveBtn = document.getElementById("jsSave");

    const INITIAL_COLOR = "#000000";
    const CANVAS_SIZE = 700;

    ctx.strokeStyle = "#2c2c2c";

    canvas.width = CANVAS_SIZE;
    canvas.height = CANVAS_SIZE;

    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);

    ctx.strokeStyle = INITIAL_COLOR;
    ctx.fillStyle = INITIAL_COLOR;
    ctx.lineWidth = 10; /* 라인 굵기 */

    let painting = false;
    let filling = false;

    function stopPainting() {
        painting = false;
    }

    function startPainting() {
        painting = true;
    }

    function onMouseMove(event) {
        const x = event.offsetX;
        const y = event.offsetY;
        if (!painting) {
            ctx.beginPath();
            ctx.moveTo(x, y);
        } else{
            ctx.lineTo(x, y);
            ctx.stroke();
        }
    }

    function handleColorClick(event) {
        const color = event.target.style.backgroundColor;
        ctx.strokeStyle = color;
        ctx.fillStyle = color;
    }

    function handleRangeChange(event) {
        const size = event.target.value;
        ctx.lineWidth = size;
    }

    function handleModeClick() {
        if (filling === true) {
            filling = false;
            mode.innerText = "Fill";
        } else {
            filling = true;
            mode.innerText = "Paint";
        }
    }

    function handleCanvasClick() {
        if (filling) {
            ctx.fillRect(0, 0, CANVAS_SIZE, CANVAS_SIZE);
        }
    }

    // 우클릭 방지
    /*
    function handleCM(event) {
       event.preventDefault();
     }
     */



    if (canvas) {
        canvas.addEventListener("mousemove", onMouseMove);
        canvas.addEventListener("mousedown", startPainting);
        canvas.addEventListener("mouseup", stopPainting);
        canvas.addEventListener("mouseleave", stopPainting);
        canvas.addEventListener("click", handleCanvasClick);
        // canvas.addEventListener("contextmenu", handleCM);

    }

    Array.from(colors).forEach(color =>
        color.addEventListener("click", handleColorClick));


    if (range) {
        range.addEventListener("input", handleRangeChange);
    }

    if (mode) {
        mode.addEventListener("click", handleModeClick);
    }

    if (saveBtn){
        saveBtn.addEventListener("click", handleSaveClick);
    }
</script>
</html>