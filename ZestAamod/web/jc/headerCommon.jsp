<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css" type="text/css"/>
        <link rel="shortcut icon" href="../img/icon.gif" type="image/x-icon">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
                padding-left:85px;
                padding-right: 85px;
            }
        </style>
        <script language="javascript">
function printdiv(printpage)
{
var headstr = "<html><head><style type='text/css' media='print,screen'> table{width: 100%;}}</style></head><body>";
var footstr = "</body>";
var newstr = document.all.item(printpage).innerHTML;
var oldstr = document.body.innerHTML;
document.body.innerHTML = headstr+newstr+footstr;
window.print();
document.body.innerHTML = oldstr;
return false;
}
</script>
        
        <title> ${param.title} - Zest & Aamod 2015</title>
    </head>
    <body>