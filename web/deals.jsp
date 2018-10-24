<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
    <title>SELECT Operation</title>
</head>

<body>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://den1.mysql5.gear.host/foodhunt"
                   user="foodhunt" password="ooad_grp3"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT id, deal, restaurant.rname, premium_membership from deals natural join restaurant;
</sql:query>

<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <th>Deal</th>
        <th>Restaurant</th>
        <th>Premium?</th>
        <th>Use</th>
    </tr>

    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.id}"/></td>
            <td><c:out value="${row.deal}"/></td>
            <td><c:out value="${row.rname}"/></td>
            <td><c:out value="${row.premium_membership}"/></td>
            <td>
                <form name="f1" action="#"><input id="edit1" type="submit" name="edit" value="Use"></form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>