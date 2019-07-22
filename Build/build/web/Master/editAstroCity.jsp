
<!DOCTYPE html>
<html>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>       
        <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <s:set name="theme" value="'simple'" scope="page" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
        <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
        <title> Subhlagan - A Bond Of Trust </title>
        <!--Do not remove - this is common css for subhlagan-->
        <link href="../css/style.css" rel="stylesheet" />
        <link href="../css/style-responsive.css" rel="stylesheet" />
        <link href="../css/subhlagan-style.css" rel="stylesheet" /> 
        <link rel="stylesheet" href="../css/datepicker.css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/bootstrap-theme.css" rel="stylesheet"/>
        <link href="../css/elegant-icons-style.css" rel="stylesheet" />
        <link href="../css/font-awesome.min.css" rel="stylesheet" />
        <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
        <script src="../js/jquery.autocomplete.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcQtbUPnDeXNOYEHFqlnXI8Nxu8RoPDjQ&amp;sensor=false&amp;libraries=places"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

        <!-- checkbox styling script -->
        <script type="text/javascript">
            $(function () {
                $("#datepicker").datepicker({dateFormat: 'dd-mm-yy'});
            });

            function editCity()
            {
                var cityName = document.getElementById('cityName').value;
                var country = document.getElementById('country').value;
                var longitude1 = document.getElementById('longitude').value;
                var latitude = document.getElementById('latitude').value;
                var longiDirection = document.getElementById('longiDirection').value;
                var latiDirection = document.getElementById('latiDirection').value;
                var gmt = document.getElementById('gmt').value;

                var regexp1 = /^[0-9,]+(\.\d{0,3})?$/;
                var regexp = /^[0-9,]+(\.\d{0,3})?$/;

                if (cityName == '')
                {
                    document.getElementById('validateCity').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateCity').style.display = "none";
                }

                if (country == 0)
                {
                    document.getElementById('validateCountry').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateCountry').style.display = "none";
                }

                if (!regexp1.test(longitude1))
                {
                    document.getElementById('validateLongitude').style.display = "block";
                    return false;
                } else {
                    document.getElementById('validateLongitude').style.display = "none";
                }


                if (longiDirection === '')
                {
                    document.getElementById('validateLongi').style.display = "block";
                    return false;
                } else
                {
                    document.getElementById('validateLongi').style.display = "none";
                }

                if (!regexp1.test(latitude))
                {
                    document.getElementById('validateLatitude').style.display = "block";
                    return false;
                } else
                {
                    document.getElementById('validateLatitude').style.display = "none";
                }

                if (latiDirection === '')
                {
                    document.getElementById('validateLati').style.display = "block";
                    return false;
                } else
                {
                    document.getElementById('validateLati').style.display = "none";
                }

                if (!regexp.test(gmt))
                {
                    document.getElementById('validateGmt').style.display = "block";
                    return false;
                } else
                {
                    document.getElementById('validateGmt').style.display = "none";
                }
            }
            function fetchDataForCity()
            {
                var astroCityName = document.getElementById("cityName").value;
                $.ajax({
                    type: "post",
                    url: "fetchGeoData",
                    data: "astroCityName=" + astroCityName,
                    success: function (html) {
                        var temp = html.split("___");
                        var long=temp[0];
                        var lat=temp[1];
                        document.getElementById('longitude').value =long.substr(0,long.indexOf(".")+4).replace(/\-/g,"");
                        document.getElementById('latitude').value = lat.substr(0,lat.indexOf(".")+4).replace(/\-/g,"");
                        document.getElementById('latiDirection').value = temp[2];
                        document.getElementById('longiDirection').value = temp[3];
                        var newCityName = astroCityName.split(",");
                        document.getElementById("cityName").value = newCityName[0];
                    }
                });
                return false;
            }

        </script>

    </head>
    <body>
        <section id="container" class="">
            <s:include value="../includes/header.jsp"/>
            <s:include value="../includes/leftmenu.jsp"/>

            <!--MAIN CONTENT STARTS-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="row">
                        <div class="col-lg-12 marginTOP">
                            <!--copy till here-->

                            <h4 class="candidateName">Edit Astro City </h4>
                            <div class="row">
                                <div class="col-lg-12" >

                                    <form action="updateAstroCity" method="post" id="formId">                                       

                                        <input type="hidden" name="masterBean.astroCityId" value="${masterBean.astroCityId}"/>             

                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>City name</label>
                                                <div class="controlsData">
                                                    <input type="text" id="cityName" name="masterBean.astroCityName" value="${masterBean.astroCityName}"id="cityName"/> 
                                                    <label id="validateCity" style="color:red!important;display:none!important; width:100%!important;">Please Enter City</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>Longitude</label>
                                                <div class="controlsData">
                                                    <input type="text" name="masterBean.longitude" value="${masterBean.longitude}" id="longitude"/>        
                                                    <label id="validateLongitude" style="color:red!important;display:none!important; width:100%!important;">Please Enter Valid Longitude</label>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Latitude</label>
                                                <div class="controlsData">
                                                    <input type="text" name="masterBean.latitude" value="${masterBean.latitude}" id="latitude"/> 
                                                    <label id="validateLatitude" style="color:red!important;display:none!important; width:100%!important;">Please Enter Valid Latitude</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>GMT</label>
                                                <div class="controlsData">
                                                    <input type="text" name="masterBean.gmtDiff" value="${masterBean.gmtDiff}" id="gmt"/>
                                                    <label id="validateGmt" style="color:red!important;display:none!important; width:100%!important;">Please Enter Valid GMT</label>
                                                </div>
                                            </div>


                                        </section>

                                        <section class="formHalf">
                                            <div class="formDATA">
                                                <label>Country</label>
                                                <div class="controlsData">
                                                    <s:select headerKey="0" headerValue="--- Select ---" cssClass="input_box" id="country"
                                                              list="countryList" listKey="AstroCountryId"  listValue="AstroCountryName" 
                                                              name="masterBean.countryId" value="%{masterBean.countryId}"  />      
                                                    <label id="validateCountry" style="color:red!important;display:none!important; width:100%!important;">Please Select Country</label>
                                                </div>
                                            </div> 

                                            <div class="formDATA">
                                                <label>Longitude Direction</label>
                                                <div class="controlsData">
                                                    <select  id="longiDirection" name="masterBean.longiDirection">
                                                        <option value="">Select</option>
                                                        <option ${masterBean.longiDirection=="E"?'selected':''} value="E">East</option>
                                                        <option ${masterBean.longiDirection=="W"?'selected':''} value="W">West</option>
                                                        <option ${masterBean.longiDirection=="N"?'selected':''} value="N">North</option>
                                                        <option ${masterBean.longiDirection=="S"?'selected':''} value="S">South</option>
                                                    </select>
                                                    <label id="validateLongi" style="color:red!important;display:none!important; width:100%!important;">Please Select Longitude Direction</label>
                                                </div>
                                            </div>

                                            <div class="formDATA">
                                                <label>Latitude Direction</label>
                                                <div class="controlsData">
                                                    <select  id="latiDirection" name="masterBean.latiDirection">
                                                        <option value="">Select</option>
                                                        <option ${masterBean.latiDirection=="E"?'selected':''} value="E">East</option>
                                                        <option ${masterBean.latiDirection=="W"?'selected':''} value="W">West</option>
                                                        <option ${masterBean.latiDirection=="N"?'selected':''} value="N">North</option>
                                                        <option ${masterBean.latiDirection=="S"?'selected':''} value="S">South</option>
                                                    </select>  
                                                    <label id="validateLati" style="color:red!important;display:none!important; width:100%!important;">Please Enter Latitude Direction</label>
                                                </div>
                                            </div>      

                                        </section>

                                        <div class="formEdit" style="margin-right: 18px;margin-top: 18px;">
                                         <input type="submit" class="btn btn-primary saveBtn" value="Fetch Data" onclick="return fetchDataForCity()"/>
                                            <input type="submit" class="btn btn-primary saveBtn" value="submit" onclick="return editCity()"/>
                                        </div>


                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </section>

        <s:include value="../includes/footer.jsp" /><!--FOOTER-->
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.hotkeys.js"></script>
        <script type="text/javascript" src="../assets/ckeditor/ckeditor.js"></script>
        <script src="../js/jquery.scrollTo.min.js"></script>
        <script src="../js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
        <script src="../js/bootstrap-datepicker.js"></script>       
        <script src="../js/scripts.js"></script>

    </body>
    <script>
                                            $(function () {
                                                $("#datepicker").datepicker({dateFormat: 'dd/mm/yy'});
                                                var options = {
                                                    types: ['(cities)'],
//                                                    componentRestrictions: {country: "ind"}
                                                };
                                                var input = (document.getElementById("cityName"));
                                                var autocomplete = new google.maps.places.Autocomplete(input, options);
                                            });
    </script>
</html>

