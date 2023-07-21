importScripts('https://www.gstatic.com/firebasejs/8.1.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.1.1/firebase-messaging.js');

firebase.initializeApp({
    apiKey: "AIzaSyBVyjlJuzy9Qd41-v2meIh79Ti7OEm0TSc",
    authDomain: "my-project-a3614.firebaseapp.com",
    databaseURL: 'https://project-id.firebaseio.com',
    projectId: "my-project-a3614",
    storageBucket: "my-project-a3614.appspot.com",
    messagingSenderId: "337911613778",
    appId: "1:337911613778:web:707752d0cacb5e27eed28b",
    measurementId: "G-D28J07Z2PH"
});

const messaging = firebase.messaging();

//백그라우드로 수신(브라우저를 닫거나 다른 사이트로 이동시)
//테스트시 크롬 닫고 다시 열어야 알림창이 뜬다

const payload = {
	notification : {
		title : "MEDI-Q",
		body : "영양제 복용 시간입니다"
	}
}

messaging.onBackgroundMessage((payload) => 
{
  console.log('[firebase-messaging-sw.js] Received background message ', payload);
  const notificationTitle = payload.notification.title;
  const notificationOptions = {body: payload.notification.body,icon: payload.notification.icon };
  return self.registration.showNotification(notificationTitle,notificationOptions);
});

//알림창 클릭시
self.addEventListener('notificationclick', event => {   
  console.log(event);
  //event.notification.close();     

});