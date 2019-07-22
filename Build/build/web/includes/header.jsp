<%@page language="java" import="com.crm.bean.Contact"%>
<%@page language="java" import="java.util.List"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">

    /***********************************************
     * Simple Marquee (04-October-2012)
     * by Vic Phillips - http://www.vicsjavascripts.org.uk/
     ***********************************************/

    var zxcMarquee = {
        init: function (o) {
            var mde = o.Mode, mde = typeof (mde) == 'string' && mde.charAt(0).toUpperCase() == 'H' ? ['left', 'offsetWidth', 'top', 'width'] : ['top', 'offsetHeight', 'left', 'height'], id = o.ID, srt = o.StartDelay, ud = o.StartDirection, p = document.getElementById(id), obj = p.getElementsByTagName('DIV')[0], sz = obj[mde[1]], clone;
            p.style.overflow = 'hidden';
            obj.style.position = 'absolute';
            obj.style[mde[0]] = '0px';
            obj.style[mde[3]] = sz + 'px';
            clone = obj.cloneNode(true);
            clone.style[mde[0]] = sz + 'px';
            clone.style[mde[2]] = '0px';
            obj.appendChild(clone);
            o = this['zxc' + id] = {
                obj: obj,
                mde: mde[0],
                sz: sz
            }
            if (typeof (srt) == 'number') {
                o.dly = setTimeout(function () {
                    zxcMarquee.scroll(id, typeof (ud) == 'number' ? ud : -1);
                }, srt);
            } else {
                this.scroll(id, 0)
            }
        },
        scroll: function (id, ud) {
            var oop = this, o = this['zxc' + id], p;
            if (o) {
                ud = typeof (ud) == 'number' ? ud : 0;
                clearTimeout(o.dly);
                p = parseInt(o.obj.style[o.mde]) + ud;
                if ((ud > 0 && p > 0) || (ud < 0 && p < -o.sz)) {
                    p += o.sz * (ud > 0 ? -1 : 1);
                }
                o.obj.style[o.mde] = p + 'px';
                o.dly = setTimeout(function () {
                    oop.scroll(id, ud);
                }, 50);
            }
        }
    }

    function init() {

        zxcMarquee.init({
            ID: 'marquee1', // the unique ID name of the parent DIV.                        (string)
            Mode: 'Vertical', //(optional) the mode of execution, 'Vertical' or 'Horizontal'. (string, default = 'Vertical')
            StartDelay: 3000, //(optional) the auto start delay in milli seconds'.            (number, default = no auto start)
            StartDirection: -1  //(optional) the auto start scroll direction'.                  (number, default = -1)
        });

        zxcMarquee.init({
            ID: 'marquee2', // the unique ID name of the parent DIV.                        (string)
            Mode: 'Horizontal', //(optional) the mode of execution, 'Vertical' or 'Horizontal'. (string, default = 'Vertical')
            StartDelay: 3000, //(optional) the auto start delay in milli seconds'.            (number, default = no auto start)
            StartDirection: -1  //(optional) the auto start scroll direction'.                  (number, default = -1)
        });

    }

    if (window.addEventListener)
        window.addEventListener("load", init, false)
    else if (window.attachEvent)
        window.attachEvent("onload", init)
    else if (document.getElementById)
        window.onload = init


</script>
<script>
    function getMatchFromHeader()
    {
//        alert("Here");
        var a = document.createElement('a');
        var linkText = document.createTextNode("my title text");
        a.appendChild(linkText);
        a.title = "my title text";
        var val = document.getElementById("txtAutoCompleteHeader").value;

        var data = val.split(" ");
        var profileId = data[data.length - 1];
        if (profileId.length > 1)
        {
            var hrefData = "/Subhlagancrm/Profile/getMatchListByName?contactId=" + profileId.substr(2, profileId.length);
            a.href = hrefData;
            document.body.appendChild(a);
            a.click();
        }


    }
</script>

<header class="header dark-bg">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-138227811-1"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag() {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());

    gtag('config', 'UA-138227811-1');
    </script>

    <div class="toggle-nav">
        <!--<div id="xyz1" class="icon-reorder tooltips " data-original-title="Toggle Navigation" data-placement="bottom"><i  class="fa fa-bars" style="color: #f75454; font-size:18px;" ></i></div>-->
        <div id="xyz1" class="icon-reorder tooltips "  data-placement="bottom"><i  class="fa fa-bars" style="color: #f75454; font-size:18px;" ></i></div>
    </div>
    <form>
        <c:choose>
            <c:when test="${(userSession.deptId==9)  || (userSession.deptId==15) || (userSession.deptId==16) || (userSession.deptId==18)}">
                <a href="${pageContext.request.contextPath}/Profile/profileList" class="logo"><img src="${pageContext.request.contextPath}/img/logo-subhlagan.svg" alt="Logo" title="Subhlagan - A Bond Of Trust"/></a>
                </c:when>
                <c:when test="${(userSession.deptId!=9) && (userSession.deptId!=15) && (userSession.deptId!=16) && (userSession.deptId!=18)}">
                <a href="${pageContext.request.contextPath}/Profile/profileList" class="logo"><img src="${pageContext.request.contextPath}/img/logo-subhlagan.svg" alt="Logo" title="Subhlagan - A Bond Of Trust"/></a>
                </c:when>
                <c:otherwise>

            </c:otherwise>
        </c:choose>
        <%--<c:if test="${(userSession.deptId==9)  || (userSession.deptId==15) || (userSession.deptId==16) || (userSession.deptId==18)} ">--%>    

            <!--<a href="${pageContext.request.contextPath}/armdashboard" class="logo"><img src="${pageContext.request.contextPath}/img/logo-subhlagan.svg" alt="Logo" title="Subhlagan - A Bond Of Trust"/></a>logo end-->
            <!--<a href="${pageContext.request.contextPath}/Profile/profileList" class="logo"><img src="${pageContext.request.contextPath}/img/logo-subhlagan.svg" alt="Logo" title="Subhlagan - A Bond Of Trust"/></a>-->
        <%--</c:if>--%>
        <%--<c:if test="${(userSession.deptId!=9) && (userSession.deptId!=15) && (userSession.deptId!=16) && (userSession.deptId!=18)}">--%>    

            <!--<a href="${pageContext.request.contextPath}/rmdashboard" class="logo"><img src="${pageContext.request.contextPath}/img/logo-subhlagan.svg" alt="Logo" title="Subhlagan - A Bond Of Trust"/></a>logo end-->
            <!--<a href="${pageContext.request.contextPath}/Profile/profileList" class="logo"><img src="${pageContext.request.contextPath}/img/logo-subhlagan.svg" alt="Logo" title="Subhlagan - A Bond Of Trust"/></a>-->
        <%--</c:if>--%>  
    </form>

    <div class="nav search-row" id="top_menu">
        <ul class="nav top-menu">                    
            <li><form class="navbar-form">
                    <div class="topNewsDiv">  <marquee  scrolldelay="200">${NEWSTITLE}</marquee> </div>

                </form></li>  

        </ul> <!--  search form end -->                
    </div>

    <div class="top-nav notification-row ">
        <div class="nameSearch" id="searchDivMatchListHeader">
            <div class="nameSearchInner" style="margin-top: 6px;">
                <input style="display:none;" type="text" id="txtAutoCompleteHeader" class="searchInput" list="searchNameHeader" name="contact.search"  placeholder="Search by Name " />
                <input style="display:none;" type="submit" id="searchMagnifyButtonHeader"  class="topsearchBtn" onclick="getMatchFromHeader()" value="">
                <!--                <select id="searchNameHeader" >
                <%--<c:forEach  var="contactListHeader" begin="0" end="10000">--%>
                    <option> </option>
                <%--</c:forEach>--%>
            </select>-->
            </div>
        </div>
        <!--<input type="text" id="txtAutoCompleteHeader" list="searchNameHeader" name="contact.search"  placeholder="Search" />-->                              

        <ul class="nav pull-right top-menu">          
            <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#" >
                    <span class="welcomeText">Welcome </span>
                    <span class="username" title="${userSession.actualName}" >${userSession.shortName}</span>
                    <b class="caret"></b>
                </a>

                <ul class="dropdown-menu extended logout">
                    <div class="log-arrow-up"></div>
                    <li class="eborder-top">
                        <a href="#"><i class="icon_profile"></i> My Profile</a>
                    </li>
                    <li>
                        <a href="/Subhlagancrm/logout" ><i class="glyphicon glyphicon-log-out"></i> Log Out</a>
                    </li>

                </ul>

            </li> <!--USER LOGIN ENDS-->
        </ul>
    </div>


</header><!--Header Ends-->
<script>
    $(document).ready(function ()
    {
        document.getElementById('txtAutoCompleteHeader').addEventListener('input', function () {
            var a = document.createElement('a');
            var linkText = document.createTextNode("my title text");
            a.appendChild(linkText);
            a.title = "my title text";
            var val = document.getElementById("txtAutoCompleteHeader").value;

            var data = val.split(" ");
            var profileId = data[data.length - 1];
            if (data.length > 3)
            {
                var hrefData = "/Subhlagancrm/Profile/getMatchListByName?contactId=" + profileId.substr(2, profileId.length);
                a.href = hrefData;
                document.body.appendChild(a);
                a.click();
            }
        });
    });
</script>






