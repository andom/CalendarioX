<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Calendario X - Cadastrar Compromisso</title>
<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
<!--[if IE]>
<link rel="stylesheet" media="all" type="text/css" href="css/pro_dropline_ie.css" />
<![endif]-->

<!--  jquery core -->
<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>
 
<!--  checkbox styling script -->
<script src="js/jquery/ui.core.js" type="text/javascript"></script>
<script src="js/jquery/ui.checkbox.js" type="text/javascript"></script>
<script src="js/jquery/jquery.bind.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$('input').checkBox();
	$('#toggle-all').click(function(){
 	$('#toggle-all').toggleClass('toggle-checked');
	$('#mainform input[type=checkbox]').checkBox('toggle');
	return false;
	});
});
</script>  


<![if !IE 7]>

<!--  styled select box script version 1 -->
<script src="js/jquery/jquery.selectbox-0.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.styledselect').selectbox({ inputClass: "selectbox_styled" });
});
</script>
 

<![endif]>


<!--  styled select box script version 2 --> 
<script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.styledselect_form_1').selectbox({ inputClass: "styledselect_form_1" });
	$('.styledselect_form_2').selectbox({ inputClass: "styledselect_form_2" });
});
</script>

<!--  styled select box script version 3 --> 
<script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.styledselect_pages').selectbox({ inputClass: "styledselect_pages" });
});
</script>


<!-- Custom jquery scripts -->
<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>
 
<!-- Tooltips -->
<script src="js/jquery/jquery.tooltip.js" type="text/javascript"></script>
<script src="js/jquery/jquery.dimensions.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('a.info-tooltip ').tooltip({
		track: true,
		delay: 0,
		fixPNG: true, 
		showURL: false,
		showBody: " - ",
		top: -35,
		left: 5
	});
});
</script> 

<!--  date picker script -->
<link rel="stylesheet" href="css/datePicker.css" type="text/css" />
<script src="js/jquery/date.js" type="text/javascript"></script>
<script src="js/jquery/jquery.datePicker.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
        $(function()
{

// initialise the "Select date" link
$('#date-pick')
	.datePicker(
		// associate the link with a date picker
		{
			createButton:false,
			startDate:'01/01/2005',
			endDate:'31/12/2020'
		}
	).bind(
		// when the link is clicked display the date picker
		'click',
		function()
		{
			updateSelects($(this).dpGetSelected()[0]);
			$(this).dpDisplay();
			return false;
		}
	).bind(
		// when a date is selected update the SELECTs
		'dateSelected',
		function(e, selectedDate, $td, state)
		{
			updateSelects(selectedDate);
		}
	).bind(
		'dpClosed',
		function(e, selected)
		{
			updateSelects(selected[0]);
		}
	);
	
var updateSelects = function (selectedDate)
{
	var selectedDate = new Date(selectedDate);
        if (selectedDate!='Invalid Date'){
            var d = selectedDate.getDate();
            var M = selectedDate.getMonth()+1;
            var y = selectedDate.getFullYear();
            
            var data = (d<=9?'0'+d:d) + "/"+ (M<=9?'0'+M:M) +"/"+ y;
            //var data=selectedDate.getDate() + "/"+(selectedDate.getMonth()+1)+"/"+selectedDate.getFullYear();
            $('#data').val(data)
        }
	/*
	$('#d option[value=' + selectedDate.getDate() + ']').attr('selected', 'selected');
	$('#m option[value=' + (selectedDate.getMonth()+1) + ']').attr('selected', 'selected');
	$('#y option[value=' + (selectedDate.getFullYear()) + ']').attr('selected', 'selected');*/
}
// listen for when the selects are changed and update the picker
$('#data')
	.bind(
		'change',
		function()
		{
			data=$(this).val().split("/")
			var d = new Date(
						data[0],
						data[1],
						data[2]
					);
					
			$('#date-pick').dpSetSelected(d.asString());
		}
	);

// default the position of the selects to today
var today = new Date();
updateSelects(today.getTime());

// and update the datePicker to reflect it...
$('#data').trigger('change');
});
</script>


        <script src="script.js" type="text/javascript"></script>
		<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
		<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
		<script type="text/javascript">
		$(document).ready(function(){
		$(document).pngFix( );
		});
		</script>
    </head>
    
<body>
<!-- Start: page-top-outer -->
<div id="page-top-outer">    

<!-- Start: page-top -->
<div id="page-top">

	<!-- start logo -->
	<div id="logo">
	<a href=""><img src="images/logo.png" width="142" height="50" alt="" /></a>
	
	</div>
	<!-- end logo -->

 	<div class="clear"></div>

</div>
<!-- End: page-top -->

</div>
<!-- End: page-top-outer -->
	
<div class="clear">&nbsp;</div>
 

 
 
 
<!-- start content-outer -->
<div id="content-outer">
<!-- start content -->
<div id="content">


<div id="page-heading"><h1>Adicionar Evento na Agenda</h1></div>


<table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
<tr>
	<th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
	<th class="topleft"></th>
	<td id="tbl-border-top">&nbsp;</td>
	<th class="topright"></th>
	<th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
</tr>
<tr>
	<td id="tbl-border-left"></td>
	<td>
	<!--  start content-table-inner -->
	<div id="content-table-inner">
	
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
	<tr valign="top">
	<td>
	
	<form action="AgendaResponse" method="post">
		<input type="hidden" name="ID" id="cod"/>
        <input type="hidden" name="acao" value="atualizar"/>
	
	
		<!-- start id-form -->
		<table border="0" cellpadding="0" cellspacing="0"  id="id-form">
		<tr>
			<th valign="top">Data:</th>
			<td class="noheight">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr  valign="top">
							<td>
                                                            <input type="text" readonly="true" class="inp-form" name="DataCompromisso" id="data" />
							
							</td>
							
							
							<td>
								&nbsp;
								<a href=""  id="date-pick"><img src="images/forms/icon_calendar.jpg"   alt="" /></a>
							</td>
						</tr>
					</table>
				
				
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th valign="top">Hora Início:</th>
			<td><input type="text" class="inp-form" name="HoraInicio" id="start" /></td>
			<td>
			<!--<div class="error-left"></div>
			<div class="error-inner">This field is required.</div>-->
			</td>
		</tr>
		<tr>
			<th valign="top">Hora Fim:</th>
			<td><input type="text" name="HoraFim" id="end" class="inp-form" /></td>
			<td></td>
		</tr>
		<tr>
		<th valign="top">Tipo:</th>
		<td>	
		<select name="Tipo" id="tipo" class="styledselect_form_1">
			<option value="1">Visita técnica</option>
              <option value="2">Visita de manutenção</option>
              <option value="3">Visita de projeto</option>
		</select>
		</td>
		<td></td>
		</tr>
		<tr>
			<th valign="top">Assunto:</th>
			<td><input type="text" name="Assunto" id="assunto" class="inp-form" /></td>
			<td></td>
		</tr>
			
	<tr>
		<th valign="top">Descrição:</th>
		<td><textarea name="Observacao" id="obs"  cols="40" rows="4"rows="" cols="" class="form-textarea"></textarea></td>
		<td></td>
	</tr>
	<tr>
		<th>&nbsp;</th>
		<td valign="top">
		
			<input type="submit" value="Gravar" name="btGravar" onclick="obrigado();" class="form-submit"/>
            <input type="button" value="Cancelar" name="btVoltar" onclick="window.location='calendar.jsp'" class="form-reset"/>
            <input type="button" value="Excluir" id="btExcluir" class="form-reset"/>
							
		</td>
		<td></td>
	</tr>
	</table>
	<!-- end id-form  -->
</form>
	</td>
	<td>

	</td>
</tr>
<tr>
<td><img src="images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
<td></td>
</tr>
</table>
 
<div class="clear"></div>
 

</div>
<!--  end content-table-inner  -->
</td>
<td id="tbl-border-right"></td>
</tr>
<tr>
	<th class="sized bottomleft"></th>
	<td id="tbl-border-bottom">&nbsp;</td>
	<th class="sized bottomright"></th>
</tr>
</table>









 





<div class="clear">&nbsp;</div>

</div>
<!--  end content -->
<div class="clear">&nbsp;</div>
</div>
<!--  end content-outer -->

 

<div class="clear">&nbsp;</div>
    
<!-- start footer -->         
<div id="footer">
	<!--  start footer-left -->
	<div id="footer-left">
	AquarioX <a href="https://github.com/andom/CalendarioX/">https://github.com/andom/CalendarioX/</a>. All rights reserved.</div>
	<!--  end footer-left -->
	<div class="clear">&nbsp;</div>
</div>
<!-- end footer -->
</body>

</html>
