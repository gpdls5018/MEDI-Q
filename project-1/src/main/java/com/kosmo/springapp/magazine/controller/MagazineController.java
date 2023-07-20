package com.kosmo.springapp.magazine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kosmo.springapp.magazine.service.impl.MagazineSelectMapper;

@Controller
public class MagazineController {
	
	@Autowired
	private MagazineSelectMapper magazineSelectMapper;
}
