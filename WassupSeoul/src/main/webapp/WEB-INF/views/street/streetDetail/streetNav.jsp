<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 고정 네비바 시작 -->
        <div class="row fixed-top" style="top: 57px;">
            <div class="col-md-4" style="background-color: rgba(27, 28, 26 ,0.6);"></div>
            <div class="col-md-4" style="padding : 0px; background-color: rgba(27, 28, 26 ,0.6);">
              <nav class="navbar py-1" style="border: 0px; width : 100%; opacity: 1.0; z-index: 8">
                <div class="container d-flex flex-column flex-md-row justify-content-between">
                    <a class="py-1" href="#" aria-label="Product"></a>
                    <a class="py-1 d-none d-md-inline-block nanum" href="#" style="text-decoration: none; color:#F5FFFA; ">게시판</a> 
                    <a class="py-1 d-none d-md-inline-block nanum" href="#" style="text-decoration: none; color:#F5FFFA; ">사진첩</a> 
                    <a class="py-1 d-none d-md-inline-block nanum" href="#" style="text-decoration: none; color:#F5FFFA; ">일정</a>
                    <%-- ${contextPath}/street/streetCalendar --%> 
                    <a class="py-1 d-none d-md-inline-block nanum" href="${contextPath}/street/juminList" style="text-decoration: none; color:#F5FFFA;">주민목록</a>
                    <a class="py-1 d-none d-md-inline-block nanum" href="${contextPath}/street/recommendFriend" style="text-decoration: none; color:#F5FFFA;">추천친구</a> 
                    <a class="py-1" href="#" aria-label="Product"></a>
                </div>
              </nav>
            </div>
            <div class="col-md-4" style="background-color:rgba(27, 28, 26 ,0.6);"></div>
       </div>
<!-- 고정 네비바 끝-->
