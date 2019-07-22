<%--
    Document   : List
    Created on : 21 Apr, 2016, 10:10:33 AM
    Author     : OpenSpace004
--%>

<%@page import="com.crm.action.ProfileAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
    System.out.println("Inside sdasd");
    List li = new ArrayList();
    ProfileAction profileAction = new ProfileAction();
    li = profileAction.autocompleteAddAstroCity();

    String[] str = new String[li.size()];
    Iterator it = li.iterator();

    int i = 0;
    while (it.hasNext()) {
        String p = (String) it.next();
        str[i] = p;
        i++;
    }
    String query = (String) request.getParameter("q");

    int cnt = 1;
    for (int j = 0; j < str.length; j++) {
        if (str[j].toUpperCase().startsWith(query.toUpperCase())) {
            out.print(str[j] + "\n");
            if (cnt >= 25)// 5=How many results have to show while we are typing(auto suggestions)
            {
                break;
            }
            cnt++;
        }
    }

%>
