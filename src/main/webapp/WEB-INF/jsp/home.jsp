<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url var="logoImgLink" value="/img/logo.png" />
<link href="https://fonts.googleapis.com/css?family=Lato|Lobster|Shrikhand|Special+Elite" rel="stylesheet">


<div id="home">
    <div class="container-fluid" style="background: white">
        <div class="row">
            <div class="col-md-12">
            		<h1>Welcome to PavePal!</h1>
            </div>
        </div>
        <div class="row home-content">
            <div class="col-md-6">
            		<img src="${logoImgLink}" alt="PavePal" id="pave-pal">
            </div>
            <div class="col-md-6" id="road-to-well-box">
            		<p id="road-to-well">"The road to well is paved over bad indentions"</p>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
