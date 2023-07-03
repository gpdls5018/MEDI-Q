package com.kosmo.springapp.config;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//***어노테이션이 아닌 xml방식으로 쿼리 실행 시 
@Configuration
//@Mapper가 붙은 매퍼 인터페이스를 스캔
//value={매퍼 인터페이스들의 패키지 나열}
//sqlSessionFactoryRef는 SqlSessionFactory 빈의 아이디 설정
@MapperScan(value = {"com.kosmo.springapp.service"}, sqlSessionFactoryRef = "sqlSessionFactory")
public class MyBatisConfig {
	
	//https://mybatis.org/spring/ko/factorybean.html
	
	//생성자 인젝션을 통해 ApplicationContext를 컨테이너로부터 받는다
	private final ApplicationContext applicationContext; //생성자 생성하므로 초기화 x
	
	public MyBatisConfig(ApplicationContext applicationContext) {
		System.out.println("스프링 컨테이너로부터 받은 ApplicationContext:"+applicationContext);
		this.applicationContext = applicationContext;
	}

	//1.databaseConfig를 필드 인젝션으로 주입받을 시]
	@Autowired
	private DatabaseConfig databaseConfig;
	
	/*
	메소드명이 아이디임으로 sqlSessionFactoryRef 속성의 값과 일치시키자
	DatabaseConfig.java의 (@Bean의 아이디 미 지정 시)
	메소드명과 sqlSessionFactory 메소드의 인자명을 일치 시켜야한다
	단, 일치하지 않더라도 '타입기반' 주입이기때문에 주입은 된다
	*/
	 
	@Bean
	//1.databaseConfig를 필드 인젝션으로 주입받을 시]
	public SqlSessionFactory sqlSessionFactory() {
	//2.databaseConfig를 필드 인젝션으로 주입받지 않을 시]
	//public SqlSessionFactory sqlSessionFactory(DataSource dataSource) { //컨테이너에 DataSource가 등록되어 있으므로 자동으로 찾는다
	
		SqlSessionFactory factory = null;
		
		try {
			SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
			
			//데이타 소스 설정: 히카리로 설정- 1.databaseConfig를 필드 인젝션으로 주입받을 시]
			factoryBean.setDataSource(databaseConfig.dataSource()); //databaseConfig 주입받을 경우 인자로 dataSource 받을 필요 X
			//데이타 소스 설정: 히카리로 설정- 2.databaseConfig를 필드 인젝션으로 주입받지 않을 시]
			//factoryBean.setDataSource(dataSource); //databaseConfig 주입받지 않고 인자로 dataSource 받을 경우
			
			//타입 별칭을 적용할 패키지 경로 설정
			factoryBean.setTypeAliasesPackage("com.kosmo.springapp");
			
			//매퍼 파일의 경로 설정
			//classpath: src/main/resources
			factoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/**.xml"));
			
			//SqlSessionFactoryBean의 getObject()로 SqlSessionFactory 얻기
			factory = factoryBean.getObject();
		}
		catch (Exception e) {e.printStackTrace();}
		
		return factory;
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
		
		return new SqlSessionTemplate(sqlSessionFactory);
	}
}
