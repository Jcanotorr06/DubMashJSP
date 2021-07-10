<%@page import="java.util.List"%>
<%@page import="Procesos.ProcesosUsuarios" %>

<%
    ProcesosUsuarios ust = new ProcesosUsuarios();
    
    List<String> todosUsuarios = ust.BuscarTodosUsuarios();
%>

<div class="mb-5 autocomplete">
    <form action="profile.jsp" id="searchform">
        <input type="search" placeholder="Buscar" class=" py-2 form-control rounded-pill" autocomplete="off" id="searchbar" name="usuario">
    </form>
</div>
<script src="../js/search.js"></script>
<script>
    var autoc = [];
    <%for(String usu:todosUsuarios){%>
        autoc.push("<%=usu%>");
    <%}%>
    autocomplete(document.getElementById("searchbar"), autoc);
    

</script>