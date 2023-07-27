package com.kosmo.springapp.qnabbs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.springapp.qnabbs.service.LikeBoardService;
import com.kosmo.springapp.service.JWTokensService;


@RestController
@RequestMapping("/like")
public class LikeBoardController {

	//토큰용 아래 3개 주입
	@Autowired
	private JWTokensService jwTokensService;
	@Value("${secret-key}")
	private String secretKey;
	@Value("${token-name}")
	private String tokenName;
	
	@Autowired
	private LikeBoardService likeBoardservice;
	
	
	
	@PostMapping("/Toggle.do")
	public int toggleLike(@RequestParam int no,HttpServletRequest req,Model model) {
		
		System.out.println("liketoggle체크요");
		//id값 불러옴
		String token= jwTokensService.getToken(req, tokenName);//token을 가져옴
		Map payload = jwTokensService.getTokenPayloads(token, secretKey);//payload로 만듬
		if(payload.get("sub") != null) {//payload는 map형태의 많은 데이터(이건 TRUE)하지만 .get("sub")를 통해 아이디가 있는지 판별(있으면 null이 아님)
			String id=payload.get("sub").toString();//가져온 id를 String id에 저장(현재 로그인한 아이디)
			
			//필요없음 model.addAttribute("id", id);//모델에 id란 이름으로 id 저장
			System.out.println("toggle여기오는가!!!!!!?");
			boolean toggle=likeBoardservice.toggleLike(id, no);
			System.out.println("toggle:"+toggle);
			int toggleInt = toggle ? 1 : 0;
			System.out.println("toggleInt: " + toggleInt);
			int togggle=likeBoardservice.getTotalLikes(no);
			System.out.println("togggle:"+togggle);
			return togggle;
		}else {//회원이 아닌 경우 클릭을 누를때
			System.out.println("회원이 아닌 경우 클릭을 누를때?");
			int toggle=likeBoardservice.getTotalLikes(no);
			return toggle; 
		}
    }
	// 게시물의 총 좋아요 개수 조회
    @GetMapping("/Count.do")
    public int getTotalLikes(@RequestParam int no) {
    	System.out.println("likeno:컨트롤러에서 확인:"+no);
        return likeBoardservice.getTotalLikes(no);
    }
	
}
