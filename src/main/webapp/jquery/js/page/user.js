/**
 * Created by Nalrarang on 2017. 3. 27
 */
/**
유저 관련 Script
@namespace User
@author nalrarang@gmail.com
@logs 20170327:Nalrarang update
*/
var log = 0
var joi = 0

//로그인 버튼 클릭 이벤트
function dologin(){
	$('.layer-wrap').css('display','none')
	$('#login-wrap').css('display','block')
}
//회원가입 버튼 클릭 이벤트
function dojoin(){
	$('.layer-wrap').css('display','none')
	$('#join-wrap').css('display','block')
}
$(document).ready(function(){
	//모달창 바깥 클릭시 모달창 꺼짐
	$('.a-close').on('click',function(){ 
		$('.layer-wrap').css('display','none')
	})
	
	//이메일로 가입하기 버튼클릭 이벤트
	$('.a-email').on('click',function(){ 
		$('#join-wrap').css('display','none')
		$('#join-write').css('display','block')
	})
})