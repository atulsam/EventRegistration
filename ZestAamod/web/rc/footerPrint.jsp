<footer class="footer" id="footer">
    <p>
        <%
            ServletContext contextFooter = getServletContext();
            out.print( contextFooter.getInitParameter("title") + " &copy; ");
            out.print(contextFooter.getInitParameter("developers"));
            
        %>
    </p>
</footer>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap-dropdown.js"></script>
</body>
</html>