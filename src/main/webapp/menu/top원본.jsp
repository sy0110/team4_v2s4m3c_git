<%@ page contentType="text/html; charset=UTF-8" %>

<DIV class='container' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->
  <header class='header'>
  <DIV class='top_home'>
      <A href='${pageContext.request.contextPath}/index.jsp'><IMG src="./images/home.png" style='width: 30px;'></A>
  </DIV>
  <DIV class='member_menu'>
      <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/list.do'>로그인</A> <span class='top_menu1'> |  </span>
      <A class='top_menu_link'  href='${pageContext.request.contextPath}/member/list.do'>회원가입</A>
  </DIV>
  <DIV class='top_img'>
    <NAV class='top_menu'>
      <span style='padding-left: 0.5%;'></span>
      <A class='top_menu_link' style='font-size: 20px;' href="${pageContext.request.contextPath}/index.jsp" >메인</A> <span class='top_menu1'> |  </span>
      <A class='top_menu_link' style='font-size: 20px;' href='${pageContext.request.contextPath}' >공지사항</A> <span class='top_menu1'> |  </span>
      <A class='top_menu_link' style='font-size: 20px;' href='${pageContext.request.contextPath}' >회사소개</A> <span class='top_menu1'> |  </span>
      <A class='top_menu_link' style='font-size: 20px;' href='${pageContext.request.contextPath}' >뉴스</A> <span class='top_menu1'> |  </span>
      <A class='top_menu_link' style='font-size: 20px;' href='${pageContext.request.contextPath}/review/list.do'>리뷰</A> <span class='top_menu1'> |  </span>    
      <A class='top_menu_link' style='font-size: 20px;' href='${pageContext.request.contextPath}/resume/read.do?=${gen_memberno}'>이력서 관리</A>    
    </NAV>
  </DIV>
  </header>
  
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-sm-3 col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <div style='margin-top: 5px;'>
        회사리뷰
      </div>
       ▷ <A href='${pageContext.request.contextPath}/review/list.do'>리뷰 전체</A>
       <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <%-- <c:import url="/cate/list_index_left.do" /> --%>  
    </div>
    </DIV>
    
  <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-sm-3 col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <div style='margin-top: 50px;'>
        이력서
      </div>
       ▷ <A href='${pageContext.request.contextPath}/resume/list_all.do'>전체글</A>
       <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <%-- <c:import url="/cate/list_index_left.do" /> --%>  
    </div>
    
    
      
    <DIV class="col-sm-9 col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
      <DIV class='content'>





