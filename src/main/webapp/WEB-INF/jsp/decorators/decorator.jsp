<%-- <%@page import="net.plang.howooaccount.system.authority.to.AuthorityEmpBean"%> --%>
<%@ page import="java.util.ArrayList"%>  <!-- ArrayList 클래스를 사용하기 위한 import -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- JSTL을 사용하기 위해 커스텀 액션을 사용하겠다 라고 선언하는 것 -->
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script> <!-- jquery를 사용하겠다 라고 선언하는 것  -->
    <script src="https://unpkg.com/@ag-grid-enterprise/all-modules@24.1.0/dist/ag-grid-enterprise.min.js"></script> <!-- aggrid를 사용하겠다 라고 선언하는 것 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> <!-- sweetalert를 사용하겠다 라고 선언하는 것, 아래 Swal.fire()메서드를 사용하기 위해서 필요함 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">  <!-- IE브라우저에서 각 버전 중 가장 최신 표준 모드를 사용하겠다고 선언하는 것 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"> <!-- viewport는 웹 페이지의 크기를 결정한다고 합니다.

    content에는 여러 값들이 있습니다.

    width=device-width는 웹 페이지의 크기가 모니터가 스마트폰의 실제 액정 크기를 따라가도록 합니다.

    initial-scale=1는 보여지는 화면의 zoom up 정도를 1배율로 한다는 것입니다. 이 값을 키우면 보여지는 화면이 줌 되어 크게 보입니다. 마치 스마트폰에서 작은 사진을 두 손가락을 이용해 확대시키는 것과 비슷합니다. 스마트폰에서만 효과가 있는 코드 같습니다.

    shrink-to-fit=no는 애플의 safari(사파리) 브라우저에만 영향을 미치는 속성 같습니다. 그 중에서도 사파리 11 이전의 버전과 관련된 것 같습니다. 사파리는 기본적으로 viewport의 크기보다 보여줘야할 내용이 크면, 보여줘야할 내용을 줄여서라 보여준다고 하네요. 그것을 방지하기 위해 이 코드를 쓴다고 합니다. -->

    <meta name="description" content=""> <!-- 웹 페이지에 대한 설명을 정의하는 예제 -->
    <meta name="author" content=""> <!-- 웹 페이지에 대한 저자를 정의하는 예제 -->

    <title><sitemesh:write property='title'/> - 73th Accounting</title>  <!-- url 요청한 페이지의 title 내용을 가져와서 쓰겠다고 선언하는 것 -->

    <!-- Custom fonts for this template-->
    <link
            href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css"
            rel="stylesheet" type="text/css">

    <!-- link 태그는 현재 문서와 외부 리소스의 관계를 나타냄, 보통 스타일 시트를 연결할 때 많이 사용함
    하지만 사이트 아이콘 연결 등 여러가지로 쓰일 수 있음
    여기선 css들을 다 한곳에 정리해둠, 그리고 들고와서 class로 추가해 사용하는 형식임-->

    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template , 100퍼 폰트 관련인듯???? 찾아봐도 잘 모르겠음-->
    <link
            href="${pageContext.request.contextPath}/assets/css/sb-admin-2.min.css"
            rel="stylesheet">
    <sitemesh:write property='head' /> <!-- url 요청한 페이지의 head 내용을 가져와서 쓰겠다고 선언하는 것, head에 있는 내용 다 가져다 쓸 수 있는듯, 확인해보자, 어떻게? -->
</head>

<body id="page-top"> <!-- body에 id값 줌 -->
<!-- Page Wrapper -->
<div id="wrapper">  <!-- div 태그는 divison의 약자로, 보통 레이아웃을 나누는데 쓴다. 특별한 기능을 가지고 있지는 않다. -->

    <!-- Sidebar 시작-->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar">
        <!-- ul 태그는 순서가 없는 list를 정의할 때 사용, 각 아이템은 li태그를 사용해서 나타낼 수 있음 -->

        <!-- Sidebar -brand-->
        <!-- 73기 브랜드를 누르는 순간 hello.jsp로 가도록 href를 걸어둠 -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/hello">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">
                73th Accounting<sup>3</sup>
            </div>
        </a>

        <!-- Divider -->
        <!-- hr 태그로 수평선을 그었음, 사이드바에 구분선을 만듬 -->
        <hr class="sidebar-divider my-0">


        <!-- Nav Item - Dashboard -->
        <!-- 다른 목록들과는 다른 css 설정이 되어있음, 어떻게 똑같이 만들지 확인해보자 -->
        <li class="nav-item active">
            <a class="nav-link collapsed Permission" href="#" data-toggle="collapse"
               data-target="#collapseDashboard" aria-expanded="true" aria-controls="collapseTwo">
                <!-- data-toggle="collapse" 클래스 스타일은 정보를 안보이도록 접었다가 클릭하면 펼쳐져서 보이게 하는 기능, 숨기기 동작이 있다.
                    그런 다음 data-target으로 버튼을 접을 콘텐츠, 예를 들면 div 태그등을 만들어서 연결하면 된다.-->
                    <i class="fas fa-fw fa-folder"></i>  <!-- i 태그는 글자를 기울여서 표시하는 태그 -->
                    <span class="confirmMenu">게시판</span> <!-- 특별한 기능은 없음, 다만 div태그와 다르게 줄바꿈이 되지 않음 -->
            </a>
            <!-- 위에 collapse로 연결한 div 태그 -->
            <div id="collapseDashboard" class="collapse"
                 aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">게시판</h6>
                    <!--작은이름 -->
                    <a id="ME009_1" class="collapse-item board" href="#">게시판 보기</a> <!-- collapse-item의 클래스 이름으로 함수 걸려있음. 누르면 db에서 url주소 가져와서 sendredirect로 url주소 강제로 바꿔줌 -->
                    <!--http://localhost:8282/Account33/+html 하이퍼링크 -->
                    <a id="ME009_2" class="collapse-item boardwrite" href="#">게시글 쓰기</a> <!-- id값을 파라매터로 넘겨서 url주소를 찾는데 사용함 -->
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!--  메뉴권한 세션 -->

        <!-- Heading -->
        <div class="sidebar-heading">업무단</div>

        <!-- 전표입력 -->
        <li class="nav-item slip"><a
                class="nav-link collapsed Permission" href="#"
                data-toggle="collapse" data-target="#collapseSilp"
                aria-expanded="true" aria-controls="collapseTwo"> <i
                class="fas fa-fw fa-folder"></i> <span class="confirmMenu">전표입력</span>
        </a>
            <div id="collapseSilp" class="collapse" aria-labelledby="headingTwo"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">전표</h6>
                    <!--작은이름 -->
                    <a id="ME001_1" class="collapse-item slip" href="#">일반전표</a>
                    <!--http://localhost:8282/Account33/+html 하이퍼링크 -->
                    <a id="ME001_2" class="collapse-item approveslip" href="#">전표승인</a>
                </div>
            </div></li>

        <!--장부 관리-->
        <li class="nav-item journal"><a
                class="nav-link collapsed Permission" href="#"
                data-toggle="collapse" data-target="#collapseJournal"
                aria-expanded="true" aria-controls="collapseUtilities"> <i
                class="fas fa-fw fa-folder"></i> <span class="confirmMenu">장부관리</span>
        </a>
            <div id="collapseJournal" class="collapse"
                 aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">장부</h6>
                    <a id="ME003_1" class="collapse-item cashJournal" href="#">현금출납장</a>
                    <a id="ME003_4" class="collapse-item assetManagement" href="#">자산관리대장</a>
                    <a id="ME003_2" class="collapse-item journalForm" href="#">분개장</a>
                    <a id="ME003_3" class="collapse-item detailTrialBalance" href="#">일(월)계표</a>
                    <a id="ME003_11" class="collapse-item accountLedger" href="#">계정별원장</a>
                    <a id="ME003_12" class="collapse-item totalAccountLedger" href="#">총계정원장</a>
                </div>
            </div></li>

        <!--결산 -->
        <li class="nav-item statement">
            <a class="nav-link collapsed Permission" href="#" data-toggle="collapse" data-target="#collapseSettlement"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-folder"></i>
                <span class="confirmMenu">결산 및 재무제표</span>
            </a>
            <div id="collapseSettlement" class="collapse"
                 aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a id="ME004_1" class="collapse-item totaltrial" href="#">합계잔액시산표</a>
                    <a id="ME004_2" class="collapse-item income" href="#">손익계산서</a>
                    <a id="ME004_3" class="collapse-item finance" href="#">재무상태표</a>
                </div>
            </div>
        </li>


        <!--전기분재무제표 -->
        <li class="nav-item early"><a
                class="nav-link collapsed Permission" href="#"
                data-toggle="collapse" data-target="#collapseTemify"
                aria-expanded="true" aria-controls="collapseUtilities"> <i
                class="fas fa-fw fa-folder"></i> <span class="confirmMenu">전기분재무제표</span>
        </a>
            <div id="collapseTemify" class="collapse"
                 aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">전기분 재무</h6>
                    <a id="ME005_1" class="collapse-item earlyCal" href="#">전기분손익계산서</a>
                    <a id="ME005_2" class="collapse-item earlyFinance" href="#">전기분재무상태표</a>
                </div>
            </div></li>

        <!--권한관리 -->
        <li class="nav-item authority"><a
                class="nav-link collapsed Permission" href="#"
                data-toggle="collapse" data-target="#collapseAuthority"
                aria-expanded="true" aria-controls="collapseUtilities"> <i
                class="fas fa-fw fa-folder"></i> <span class="confirmMenu">권한관리</span>
        </a>
            <div id="collapseAuthority" class="collapse"
                 aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">권한설정</h6>
                    <a class="collapse-item authorityGroup" id="ME007_1" href="#">권한그룹설정</a>
                    <a class="collapse-item menuAuthority" id="ME007_2" href="#">메뉴권한설정</a>
                </div>
            </div></li>

        <!--예산관리 -->
        <li class="nav-item budget"><a
                class="nav-link collapsed Permission" href="#"
                data-toggle="collapse" data-target="#test" aria-expanded="true"
                aria-controls="collapseUtilities"> <i
                class="fas fa-fw fa-folder"></i> <span class="confirmMenu">예산관리</span>
        </a>
            <div id="test" class="collapse" aria-labelledby="headingUtilities"
                 data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">예산</h6>
                    <a id="ME006_1" class="collapse-item ApplyBudget" href="#">예산신청</a>
                    <a id="ME006_2" class="collapse-item PlanBudget" href="#">예산편성</a>
                    <a id="ME006_3" class="collapse-item ManageBudget" href="#">예산대비실적현황</a>
                </div>
            </div>
        </li>


        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Nav Item - Pages Collapse Menu -->
        <c:if test="${sessionScope.empName!=null}">  <!-- 조건에 따라 분기를 처리할 수 있는 태그, 속성내의 값이 참이면 실행된다 -->
            <li class="nav-item"><a class="nav-link collapsed" href="#"
                                    data-toggle="collapse" data-target="#collapsePages"
                                    aria-expanded="true" aria-controls="collapsePages"> <i
                    class="fas fa-fw fa-cog"></i> <span class="confirmMenu" id="btn">기본설정</span>
            </a>
                <div id="collapsePages" class="collapse"
                     aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">설정</h6>
                        <a id="ME002_5" class="collapse-item profile" href="#">내프로필</a>
                        <a id="ME002_1" class="collapse-item manageWorker" href="#">사원관리</a>
                        <a id="ME002_2" class="collapse-item registerWorkplace" href="#">회사등록</a>
                        <a id="ME002_3" class="collapse-item registerCustomer" href="#">거래처 관리</a>
                        <a id="ME002_4" class="collapse-item registerExport" href="#">계정과목 및 적요</a>
                    </div>
                </div>
            </li>
            <hr class="sidebar-divider d-none d-md-block">
        </c:if>

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <%----------------------------------------------------------------------------------------------------------%>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-secondary topbar mb-4 static-top shadow">

                <!-- Topbar Search --> <!-- 기능구현 안되어있음 -->
                <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                               placeholder="Search for..." aria-label="Search"
                               aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>

                <!-- Topbar Navbar -->
                <nav class="navbar navbar-expand-sm navbar-dark d-flex justify-content-center align-items-center">
                    <ul class="navbar-nav navbar-dark style='cursor:pointer'; ">

                        <!-- 상단 바 전표입력 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white Permission"
                               data-toggle="dropdown" href="#">전표입력</a>
                            <div class="dropdown-menu">
                                <a id="ME001_1" class="dropdown-item slip" href="#">일반전표</a>
                                <a id="ME001_2" class="dropdown-item approveslip" href="#">전표승인</a>
                            </div>
                        </li>
                        <!-- 상단 바 장부관리 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white Permission"
                               data-toggle="dropdown" href="#">장부관리</a>
                            <div class="dropdown-menu">
                                <a id="ME003_1" class="dropdown-item cashJournal" href="#">현금출납장</a>
                                <a id="ME003_4" class="dropdown-item assetManagement" href="#">자산관리대장</a>
                                <a id="ME003_2" class="dropdown-item journalForm" href="#">분개장</a>
                                <a id="ME003_3" class="dropdown-item detailTrialBalance" href="#">일(월)계표</a>
                                <a id="ME003_11" class="dropdown-item accountLedger" href="#">계정별원장</a>
                                <a id="ME003_12" class="dropdown-item totalAccountLedger" href="#">총계정원장</a>
                            </div>
                        </li>
                        <!-- 상단 바 결산 및 재무제표 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white Permission"
                               data-toggle="dropdown" href="#">결산 및 재무제표</a>
                            <div class="dropdown-menu">
                                <a id="ME004_1" class="dropdown-item totaltrial" href="#">합계잔액시산표</a>
                                <a id="ME004_2" class="dropdown-item income" href="#">손익계산서</a>
                                <a id="ME004_3" class="dropdown-item finance" href="#">재무상태표</a>
                            </div>
                        </li>
                        <!-- 상단 바 전기분재무제표 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white Permission"
                               data-toggle="dropdown" href="#">전기분재무제표</a>
                            <div class="dropdown-menu">
                                <a id="ME005_1" class="dropdown-item earlyCal" href="#">전기분손익계산서</a>
                                <a id="ME005_2" class="dropdown-item earlyFinance" href="#">전기분재무상태표</a>
                            </div>
                        </li>
                        <!-- 권한관리 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white Permission"
                               data-toggle="dropdown" href="#">권한관리</a>
                            <div class="dropdown-menu">
                                <a id="ME007_1" class="dropdown-item authorityGroup" href="#">권한그룹설정</a>
                                <a id="ME007_2" class="dropdown-item menuAuthority" href="#">메뉴권한설정</a>
                            </div>
                        </li>
                        <!-- 예산관리 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white Permission"
                               data-toggle="dropdown" href="#">예산관리</a>
                            <div class="dropdown-menu">
                                <a id="ME006_1" class="dropdown-item ApplyBudget" href="#">예산신청</a>
                                <a id="ME006_2" class="dropdown-item PlanBudget" href="#">예산편성</a>
                                <a id="ME006_3" class="dropdown-item ManageBudget" href="#">예산대비실적현황</a>
                            </div>
                        </li>
                        <!-- 기본설정 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white"
                               data-toggle="dropdown" href="#">기본설정</a>
                            <div class="dropdown-menu">
                                <a id="ME002_5" class="dropdown-item profile" href="#">내 프로필</a>
                                <a id="ME002_1" class="dropdown-item manageWorker" href="#">사원관리</a>
                                <a id="ME002_2" class="dropdown-item registerWorkplace" href="#">회사등록</a>
                                <a id="ME002_3" class="dropdown-item registerCustomer" href="#">거래처 관리</a>
                                <a id="ME002_4" class="dropdown-item registerExport" href="#">계정과목 및 적요</a>
                            </div>
                        </li>
                        <c:if test="${sessionScope.empName!=null}">
                            <!-- Nav Item - Messages -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle text-white Permission"
                                   href="${pageContext.request.contextPath}/base/email"
                                   id="messagesDropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">이메일전송
                                    <i class="fas fa-envelope fa-fw"></i>
                                    <!-- Counter - Messages -->
                                    <span class="badge badge-danger badge-counter"></span> <!-- 메세지 갯수가 날아와야함   -->
                                </a>
                            </li>
                            <div class="topbar-divider d-none d-sm-block"></div>
                        </c:if>
                    </ul>
                </nav>
                <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <!-- 조건에 따라 여러곳으로 분기가능, 조건이 맞은것이 없으면 기본 분기 제공 가능, when, otherwise -->
                        <c:choose>
                        <c:when test="${sessionScope.empName!=null}">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown"
                               role="button" data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-black-50-600 small">${sessionScope.empName}</span>
                                <img class="img-profile rounded-circle"
                                     src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="userDropdown">
                                <a class="dropdown-item" id="ME002_5" href="#" style="text-align: center">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400" ></i>프로필
                                </a>
                                <hr class="sidebar-divider">
                                <a href="#" data-toggle="modal"
                                   data-target="#logoutModal" text-align="center">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400" ></i>로그아웃
                                </a>
                                <!-- 글자 오른쪽 정렬 안됨 ㅅㅂ 어케된건지 모르겠음 -->
                            </div>                           <!-- otherwise절 시작 -->
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link dropdown-toggle"
                               href="${pageContext.request.contextPath}/loginform">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그인</span>
                                <img class="img-profile rounded-circle"
                                     src="${pageContext.request.contextPath}/assets/img/profile.png">
                            </a>
                        </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </nav>

            <!-- End of Topbar -->


            <!-- 바디 부분 시작 -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <sitemesh:write property='body' />
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; </span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->


<!-- Scroll to Top Button-->

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">퇴근하시나요?</h5>
                <button class="close" type="button" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                잊으신 중요한 업무가 없으신가요?<br> 업무를 마칠 준비를 다 하셨다면 로그아웃을 눌러주세요!
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button"
                        data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary"
                   href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
    </div>
</div>


<script src="https://unpkg.com/@ag-grid-enterprise/all-modules@24.1.0/dist/ag-grid-enterprise.min.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/assets/js/sb-admin-2.min.js"></script>

<!-- Page level plugins-->
<script src="${pageContext.request.contextPath}/assets/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/assets/js/demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/demo/chart-pie-demo.js"></script>


<%-- <% ArrayList<String> menuList = (ArrayList<String>) session.getAttribute("menuList");%> --%>

<script>
    // 로그인폼에서 로그인 하는 동시 menulist를 포함한 여러가지(loginForm 참조할것)를 전부 session.setAttribute로 세션에 등록해둠.
    // .Permission 클래스 속성을 가진 모든 태그들을 누를 때 아래의 이벤트가 발생
    // 현재 누른 버튼의 주소값 안의 text를 공백제거하고 글자만 남긴다음, menulist에서 받아온 값을 저장하는 arr 변수와 비교하게 되어있음
    // includes함수(반환형 boolean)를 통해 공백제거한 text 내용이 arr 내용안에 있다면, 문제없지만 false일경우 alertFunc 메서드를 실행하도록 되어 있음
    // 간략히 말해서 권한 확인을 위한 장치라고 생각하면 됨
    var arr = "<%=(ArrayList<String>)session.getAttribute("menuList")%>";
    $(document).on('click', '.Permission', function(e){
        console.log("" +
            "");
        console.log(arr);
        var text = "";
        var isAuthority = "";
        console.log($(this));
        console.log($(this).text()); // 현재 누른 버튼의 주소값에서 innertext의 값을 들고옴, 하지만 공백도 같이 들고와서 trim함수로 공백을 다 제거해줌
        text = $.trim($(this).text());
        console.log(text);
        console.log("@@@@@@@@@@@@@@@@@@@@@@@@@");
        isAuthority = arr.includes(text);
        console.log(isAuthority);
        if(isAuthority == false){
            alertFunc();
        }
    });

    function alertFunc(){
        Swal.fire({
            icon : 'error',
            title : '접근 불가',
            text : '접근 권한을 확인해주세요',
            footer : '관리자에게 문의하세요',
            buttons :{
                confirm:{
                    text:'확인',
                    value:true
                }
            }
        }).then((result)=>{
            if(result){
                $(location).attr("href","${pageContext.request.contextPath}/loginform");
            }
        })
    }

    /*수정중  */
    $(document).ready(function () {
        var deptCode=`${deptCode}`;
        console.log("deptCode :"+deptCode);
        showAuthorityEmp(deptCode);

        $('.collapse-item, .dropdown-item').on('click', function(e){
            $(location).attr("href","${pageContext.request.contextPath}/url?menuCode="+$(this).attr("id"));
        });
    });
    function showAuthorityEmp(deptCode) {
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/operate/authorityemp",
            data: {
                "deptCode": deptCode
            },
            dataType: "json",
            success: function (jsonObj) {
                console.log("      @showAuthorityEmp 로드 성공");
                console.log("jsonObj.authorityEmp"+JSON.stringify(jsonObj));
                controlEmp(jsonObj);
            }
        });
    }
    function controlEmp(arrayEmp){
        var array = [];
        console.log(arrayEmp);
        arrayEmp.map(function(obj){
            array.push(obj);
        });

        var menuName=JSON.stringify(array[0].menuName);
        showAuthorityControlDetail(menuName);

    }
    function showAuthorityControlDetail(menuName) {


        menuName = menuName.replaceAll("\"","");

        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/operate/authoritymenu",
            data: {
                "menuName": menuName
            },
            dataType: "json",
            success: function (jsonObj) {
                console.log("      @showAuthorityDetail 성공");
                console.log("jsonObj@@@ : "+JSON.stringify(jsonObj));
                starUrlAddress(jsonObj);


            }
        });

    }
    /* URL IF 문 시작 */

    function starUrlAddress(arrayUrl){
        console.log("arrayUrl :" + JSON.stringify(arrayUrl));
        arrayUrl.map(function(obj){
            var level =obj.authority;
            var url = obj.url;
            var menuCode = obj.menuCode;
            var gobacktoHello = "${pageContext.request.contextPath}/hello";

            if(menuCode =="ME001" && level=="0"){

                $(".slip, .approveslip").click(function(){
                    alertFunc();
                    event.preventDefault();

                });

            }

            else if(menuCode =="ME002" && level=="0"){

                $(".profile, .manageWorker, .registerWorkplace,.registerProject,.registerCustomer,.registerExport").click(function(){
                    alertFunc();
                    event.preventDefault();

                });

            }
            else if(menuCode =="ME003" && level=="0"){

                $(".cashJournal, .journalForm, .detailTrialBalance, .assetManagement, .accountLedger, .totalAccountLedger").click(function(){
                    alertFunc();
                    event.preventDefault();

                });

            }
            else if(menuCode =="ME004" && level=="0"){
                $(".totaltrial, .income, .finance").click(function(){
                    alertFunc();
                    event.preventDefault();

                });

            }
            else if(menuCode =="ME005" && level=="0"){
                $(".earlyCase, .earlyCal, .earlyFinance").click(function(){
                    alertFunc();
                    event.preventDefault();

                });

            }
            else if(menuCode =="ME006" && level=="0"){
                $(".ApplyBudget, .PlanBudget, .ManageBudget").click(function(){
                    alertFunc();
                    event.preventDefault();

                });

            }
            else if(menuCode =="ME007" && level=="0"){
                $(".authorityGroup, .menuAuthority").click(function(){
                    alertFunc();
                    event.preventDefault();

                });

            }
            else if(menuCode =="ME009" && level=="0"){
                $(".board, .boardwrite").click(function(){
                    alertFunc();
                    event.preventDefault();

                });

            }
        })
    }
</script>
</body>

</html>