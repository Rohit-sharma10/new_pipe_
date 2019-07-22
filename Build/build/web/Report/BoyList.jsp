<%-- 
    Document   : List
    Created on : 6 Sep, 2016, 12:29:18 PM
    Author     : OpenSpace
--%>
<%@page import="com.crm.action.ProfileAction"%>
<%@page import="com.crm.action.MasterAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
//    System.out.println("Inside movedList");
    List li = new ArrayList();
    ProfileAction profileAction = new ProfileAction();
    li = profileAction.autocompleteUserListBoyGirl("M");

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
