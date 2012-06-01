<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Calendario X - Cadastrar Compromisso</title>
        
        <link rel='stylesheet' type='text/css' href='css/style.css' />        
        <script src="jquery.min.js" type="text/javascript"></script>
        <script src="script.js" type="text/javascript"></script>   
        
        <script type="text/javascript">
            $(document).ready(function(){
                if (QueryString("id")!=""){
                    var url='AgendaServlet?id='+QueryString("id");
                    var valores=new Array()
                    $.get(url,function(data){
                        valores=data.split('|');
                        $('#cod').val((valores[0]));
                        $('#tipo').val((valores[1]));
                        $('#data').val((valores[2]));
                        $('#start').val((valores[3]));
                        $('#end').val((valores[4]));
                        $('#assunto').val((valores[5]));
                        $('#obs').val((valores[6]));
                    })
                }
                if (QueryString("data")!="" && QueryString("inicio")!="" && QueryString("fim")!=""){
                    $('#cod').val(QueryString("id"));
                    $('#data').val(QueryString("data"));
                    $('#start').val(QueryString("inicio"));
                    $('#end').val(QueryString("fim"));
                }
                //botâo para deletar
                if (QueryString("id")!=""){
                    $("#btExcluir").click(function() {
                        var url='AgendaResponse?id='+QueryString("id")+'&acao=deletar';
                        window.location=url;
                    });
                }
                else{
                    $("#btExcluir").hide();
                    
                }

            })

        </script>
    </head>
    
<body>
<div id="principal">
    <div id="principal2">
        <div id="conteudo">
	    <div id="logo">
                <img src="xxxxx" alt="logo aquário" />
            </div>
	    <div id="dados" >
            	<div class="txt_dados">
                    informações
                </div>
            </div>
            <div id="informacoes">
                <form action="AgendaResponse" method="post">
                    
                    <input type="hidden" name="ID" id="cod"/>
                    <input type="hidden" name="acao" value="atualizar"/>
                    <li class="txt_geral">
                        <ul>Data: <input type="text" name="DataCompromisso" id="data" class="txt_dados"/></ul>
                        <ul>Inicio: <input type="text" name="HoraInicio" id="start" class="txt_dados"/></ul>
                        <ul>Fim: <input type="text" name="HoraFim" id="end" class="txt_dados"/></ul>
                        <ul>Tipo: <select name="Tipo" id="tipo" class="txt_dados">
                                <option value="1">Visita técnica</option>
                                <option value="2">Visita de manutenção</option>
                                <option value="3">Visita de projeto</option>
                            </select></ul>
                        <ul>Assunto: <input type="text" name="Assunto" id="assunto" class="txt_dados"/></ul>
                        <ul>Descrição: <textarea name="Observacao" id="obs" class="txt_dados" cols="40" rows="4"></textarea></ul>

                        <ul><input type="submit" value="Gravar" name="btGravar" onclick="obrigado();" class="button"/>
                            <input type="button" value="Cancelar" name="btVoltar" onclick="window.location='calendar.jsp'" class="button"/>
                            <input type="button" value="Excluir" id="btExcluir" class="button"/></ul>
                    </li>
                </form>                
            </div>
            <div id="rodape">
            	<div class="txt_rodape_destaque">
                    rodapé
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
