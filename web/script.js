function QueryString(ID) {
    var URL = document.location.href;
    if (URL.indexOf('?' + ID + '=') > -1 || URL.indexOf('&' + ID + '=') > -1) {
        var qString = URL.split('?');
        var keyVal = qString[1].split('&');
        for (var i = 0; i < keyVal.length; i++) {
            if (keyVal[i].indexOf(ID + '=') == 0) {
                var val = keyVal[i].split('=');
                return val[1];
            }
        }
        return "";
    }
    else {
        return "";
    }
}
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