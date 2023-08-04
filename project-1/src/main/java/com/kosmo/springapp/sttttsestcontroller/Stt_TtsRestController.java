package com.kosmo.springapp.sttttsestcontroller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Stt_TtsRestController {

	@Value("${apiKey}")
    private String apiKey;

    @GetMapping("/config/apiKey")
    public ResponseEntity<String> getApiKey() {
        return ResponseEntity.ok(apiKey);
    }
}
