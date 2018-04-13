<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url var="logoImgLink" value="/img/logo.png" />

<%--<c:url var="logoImgLink" value="/img/logo.png" />--%>
<%--<img src="${logoImgLink}" alt="Pave Pal" width="25%">--%>
<%--<h1>Welcome to Pave Pal!</h1>--%>

<%--<h3>"The road to well is paved over bad indentions"</h3>--%>

<div id="home">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
        <img src="${logoImgLink}" alt="Pave Pal" width="25%">
        </div>
        <div class="row">
        </div>
            <div class="col-md-12">
                <h1>Welcome to Pave Pal!</h1>

                <h3>"The road to well is paved over bad indentions"</h3>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />