<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 고정 네비바 시작 -->
        <div class="row fixed-top" style="top: 54px;">
            <div class="col-md-4" style="background-color: rgba(255, 255, 255 ,0.4);"></div>
            <div class="col-md-4" style="padding : 0px; background-color: rgba(255, 255, 255 ,0.4);">
              <nav class="navbar py-1" style="border: 0px; width : 100%; opacity: 1.0; z-index: 8">
                <div class="container d-flex flex-column flex-md-row justify-content-between">
                    <a class="py-1" href="#" aria-label="Product"></a>
                    <a class="py-1 d-none d-md-inline-block nanum navHover" href="${contextPath}/street/streetMain?streetNo=${streetNo}" style="text-decoration: none; color:#5a5a5a; ">게시판</a> 
                    <!-- 3/25 미현 사진첩 부분 수정  -->
                    <a class="py-1 d-none d-md-inline-block nanum navHover" href="${contextPath}/street/photoAlbum?streetNo=${streetNo}" style="text-decoration: none; color:#5a5a5a; ">사진첩</a> 
                    <a class="py-1 d-none d-md-inline-block nanum navHover" href="${contextPath}/street/calendar?streetNo=${streetNo}" style="text-decoration: none; color:#5a5a5a; ">일정</a>
                    <%-- ${contextPath}/street/streetCalendar --%> 
                    <a class="py-1 d-none d-md-inline-block nanum navHover" href="${contextPath}/street/juminList?streetNo=${streetNo}" style="text-decoration: none; color:#5a5a5a;">주민목록</a>
                    <a class="py-1 d-none d-md-inline-block nanum navHover" href="${contextPath}/street/recommendFriend?streetNo=${streetNo}" style="text-decoration: none; color:#5a5a5a;">추천친구</a> 
                    <a class="py-1" href="#" aria-label="Product"></a>
                </div>
              </nav>
            </div>
            <div class="col-md-4" style="background-color:rgba(255, 255, 255 ,0.4);"></div>
       </div>
<!-- 고정 네비바 끝-->
