<%-- 
    Document   : table
    Created on : 26.04.2021, 13:53:38
    Author     : kain
--%>

<%@page import="com.kain.parser.tableJSON.Root"%>
<%@page import="com.kain.parser.tableJSON.Parameter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table</title>
    </head>
    <body>
                <form method="post" action="tableJSON?action=openNew" enctype="multipart/form-data">
                    <h3>Выберите файл и нажмите Открыть</h3>
                    <input type="file" name="file" />
                    <input type="submit" value="Открыть" />
                </form>
<form method="post" action="tableJSON?action=submit">
    <table border="1"><thead>" <tr><td>name</td><td>group</td><td>value</td></tr></thead><tbody>     
            <c:forEach items="${json.parameters}" var="i" varStatus="counter">              
                <tr>         
                    <c:choose>
                        <c:when test="${fn:contains(i.name, 'nsgbr')}">
                            <td bgcolor="#5FFF33"> <input type="text" name="name" value="${i.name}"> </td>
                        </c:when>
                        <c:otherwise>
                            <td> <input type="text" name="name" value="${i.name}"> </td>
                        </c:otherwise>
                    </c:choose>
                <td> <input type="text" name="group" value="${i.group}"> </td>
                <td> <input type="text" name="value" value="${i.value}" size="80"> </td>
                </tr>
            </c:forEach>
         </tbody></table>
    <input type="hidden" name="count" value="${fn:length(json.parameters)}">
            <div style="display: inline-block">
                <input type="submit" name="save" value="Save" />
                <input type="button" value="Back" onclick="location.href='index.html';" />
            </div>
</form>

    </body>
</html>
