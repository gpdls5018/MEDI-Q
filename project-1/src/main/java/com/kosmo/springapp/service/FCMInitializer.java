package com.kosmo.springapp.service;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

@Service
public class FCMInitializer {
	//FCM 초기화
	/*
	 * 어플리케이션이 시작될 때 Firebase 프로젝트에 앱을 등록해줘야 한다. 
	 * (두번 등록 되면 에러가 나므로 시작할 때 초기화 해준다.) 
	 * @PostConstruct 어노테이션을 활용하여 Bean Object가 생성되고, 
	 * DI 작업까지 마친 다음 실행시키도록 한다.
	 */

    private static final Logger logger = LoggerFactory.getLogger(FCMInitializer.class);
    public static final String FIREBASE_CONFIG_PATH = "webpush.json";

    @PostConstruct
    public void initialize() {

        try {
            FirebaseOptions options = new FirebaseOptions.Builder()
            		//다운받은 비밀키로 증명
                    .setCredentials(GoogleCredentials.fromStream(new ClassPathResource("json"+File.separator+FIREBASE_CONFIG_PATH).getInputStream())).build();
            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseApp.initializeApp(options);
                logger.info("Firebase application has been initialized");
            } 
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
    }
}
