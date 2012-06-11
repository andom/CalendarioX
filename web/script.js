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
function redirectCalendar(){
	window.location="index.jsp";
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
							var action=$('#formAgenda').attr('action')
							action+= "?id="+QueryString("id")+'&acao=deletar';
							$.post(action,function(data){
								if(data['status']==0){
									$('#message-green').show()						
									$('#message-green .green-left').html(data['msg']+" <a href=\"index.jsp\">Clique aqui para voltar ao calendário!")
									setTimeout('redirectCalendar()',3000)
									return false;
								}
								else{
									$('#message-red').show()						
									$('#message-red .red-left').html(data['msg'])
									return false;
								}							
							},"json");
							return false;
                    });
                }
                else{
                    $("#btExcluir").hide();
                    
                }
				
				$('#gravar').click(function(){
						if($('#data').val()=="NaN/NaN/NaN"){
							$('#message-red').show()						
							$('#message-red .red-left').html('Data Inválida! Escolha uma data válida!')
							$('#errorData').show()
							return false;
						}
						else if($('#start').val()=="" || $('#start').val().toString().length<5){
							$('#message-red').show()						
							$('#message-red .red-left').html('Por favor digite um horário de início válido!')
							$('#errorHoraInicio').show()
							$('#errorData').hide()
							return false;
						}
						else if($('#end').val()=="" || $('#end').val().toString().length<5){
							$('#message-red').show()						
							$('#message-red .red-left').html('Por favor digite um horário de fim válido!')
							$('#errorHoraFim').show()
							$('#errorData').hide()
							$('#errorHoraInicio').hide()
							return false;
						}
						else if($('#assunto').val()==""){
							$('#message-red').show()						
							$('#message-red .red-left').html('Por favor digite um assunto!')
							$('#errorAssunto').show()
							$('#errorHoraFim').hide()
							$('#errorData').hide()
							$('#errorHoraInicio').hide()
							return false;
						}
						else{
							$('#errorAssunto').hide()
							$('#errorHoraFim').hide()
							$('#errorData').hide()
							$('#errorHoraInicio').hide()
						
							var action=$('#formAgenda').attr('action')
							action+= "?"+$('#formAgenda').serialize();
							$.post(action,function(data){
						
								if(data['status']==0){
									$('#message-green').show()						
									$('#message-green .green-left').html(data['msg']+" <a href=\"index.jsp\">Clique aqui para voltar ao calendário!")
									setTimeout('redirectCalendar()',3000)
									return false;
								
								}
								else{
									$('#message-red').show()						
									$('#message-red .red-left').html(data['msg'])
									return false;
								}							
							},"json");
							return false;
						
						}
				})
            })