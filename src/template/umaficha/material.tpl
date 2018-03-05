<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title> Lista de Material da Ficha de Prática</title>
    <meta name="generator" content="LibreOffice 5.4.5.1 (Linux)"/>
    <meta name="author" content="Maria de Fatima"/>
    <meta name="created" content="2008-08-29T18:47:00"/>
    <meta name="changed" content="2018-03-04T10:50:01.632145836"/>
    <link rel="stylesheet" href="/imagem/tablestyle.css" type="text/css" />
<body>
    <h1>Lista de Material da Ficha de Prática</h1>
    <table id="box-table-a" >

        <thead>
            <tr>
                <th scope="col"><span>Descrição do material</span></th>

                <th scope="col"><span>Quantidade</span></th>


            </tr>
        </thead>


        <tbody>
            % for line in result:
            <tr>
                <td><span>{{ line["descreve"] }}<span></td>
                <td><span>{{ line["quantidade"] }}<span></td>
            </tr>
            % end
        </tbody>

    </table>
</body>
</html>