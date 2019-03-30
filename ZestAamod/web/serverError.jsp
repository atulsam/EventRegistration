<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="shortcut icon" href="icon.gif" type="image/x-icon">
            <title>Error Page</title>
            <style>
                body {background: #FFFFFF;margin: 0; padding: 20px; text-align:center; font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#666666;}
                .error_page {width: 600px; padding: 50px; margin: auto;}
                .error_page h1 {margin: 20px 0 0;}
                .error_page p {margin: 10px 0; padding: 0;}		
                a {color: #9caa6d; text-decoration:none;}
                a:hover {color: #9caa6d; text-decoration:underline;}
            </style>
    </head>
    <body class="login">
        <div class="error_page">
            <img alt="Kidmondo_face_sad" src="img/500.gif">
                <h1>500.</h1>
                <h1>We're sorry...</h1>
                <p>Internal Server Error</p>
                <p><a href="javascript:history.back()">Go back</a> Or 
                    <a href="<% ServletContext sc = getServletContext();
                        out.println(sc.getServletContextName());
                       %>">Click Here</a> to go to homepage</p>
                    <%out.println(sc.getServletContextName());%>
        </div>

    </body>
</html>
