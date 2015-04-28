// Bootstrap Datepicker by eternicode
datepicking = function() {
    $(".bootlayout-date").datepicker({
        format: "dd/mm/yyyy",
        todayBtn: "linked",
        language: "es",
        todayHighlight: true,
        close: true
    });
};

$(document).ready(datepicking);
$(document).on('page:load', datepicking);

function setSAECodeIncomes() {

	saeCode = "";

	if ($('#income_lab_id').val()==1)
		saeCode = "01.05.03.01";

	if ($('#income_lab_id').val()==2)
		saeCode = "01.05.03.03";

	if ($('#income_lab_id').val()==3)
		saeCode = "01.05.03.04";

	if ($('#income_lab_id').val()==4)
		saeCode = "01.05.03.05";

	if ($('#income_lab_id').val()==5)
		saeCode = "01.05.03.06";

	if ($('#income_lab_id').val()==6)
		saeCode = "01.05.03.07";

	if ($('#income_lab_id').val()==7)
		saeCode = "01.05.03.08";

	if ($('#income_lab_id').val()==8)
		saeCode = "01.05.03.09";

	if ($('#income_lab_id').val()==9)
		saeCode = "01.05.03.02";

	$('#income_sae_code').val(saeCode);

}

function setSAECodeCommitments() {

	saeCode = "";
	if ($('#commitment_lab_id').val()==1)
		saeCode = "01.05.03.01";

	if ($('#commitment_lab_id').val()==2)
		saeCode = "01.05.03.03";

	if ($('#commitment_lab_id').val()==3)
		saeCode = "01.05.03.04";

	if ($('#commitment_lab_id').val()==4)
		saeCode = "01.05.03.05";

	if ($('#commitment_lab_id').val()==5)
		saeCode = "01.05.03.06";

	if ($('#commitment_lab_id').val()==6)
		saeCode = "01.05.03.07";

	if ($('#commitment_lab_id').val()==7)
		saeCode = "01.05.03.08";

	if ($('#commitment_lab_id').val()==8)
		saeCode = "01.05.03.09";

	if ($('#commitment_lab_id').val()==9)
		saeCode = "01.05.03.02";

	$('#commitment_sae_code').val(saeCode);

}

function setSAECode() {

	saeCode = "";

	if ($('#project_admin').val()=="marquez")
		saeCode = "01.05.03.11";

	if ($('#project_admin').val()=="villa")
		saeCode = "01.05.03.10";

	$('#project_sae_code').val(saeCode);

}

function setCommitmentAmount() {
	if (!isNaN(parseFloat($('#commitment_amount').val()))) {
		$('#commitment_amount').val(formatAmount($('#commitment_amount').val()));
	}		
}

function setExecutionAmount() {
	if (!isNaN(parseFloat($('#execution_check_amount').val()))) {
		$('#execution_check_amount').val(formatAmount($('#execution_check_amount').val()));
	}		
}

function setIncomeAmount() {
	if (!isNaN(parseFloat($('#income_amount').val()))) {
		$('#income_amount').val(formatAmount($('#income_amount').val()));
	}		
}

function setProjcommitmentAmount() {
	if (!isNaN(parseFloat($('#projcommitment_amount').val()))) {
		$('#projcommitment_amount').val(formatAmount($('#projcommitment_amount').val()));
	}		
}

function setProjexecutionAmount() {
	if (!isNaN(parseFloat($('#projexecution_check_amount').val()))) {
		$('#projexecution_check_amount').val(formatAmount($('#projexecution_check_amount').val()));
	}		
}

function setProjincomeAmount() {
	if (!isNaN(parseFloat($('#projincome_amount').val()))) {
		$('#projincome_amount').val(formatAmount($('#projincome_amount').val()));
	}		
}

function setEquipments() {
	$('#project_equipments').val(formatAmount($('#project_equipments').val()));
}

function setServices() {
	$('#project_services').val(formatAmount($('#project_services').val()));
}

function setInfrastructure() {
	$('#project_infrastructure').val(formatAmount($('#project_infrastructure').val()));
}

function setHhrr() {
	$('#project_hhrr').val(formatAmount($('#project_hhrr').val()));
}

function setConsumables() {
	$('#project_consumables').val(formatAmount($('#project_consumables').val()));
}

function setFurniture() {
	$('#project_furniture').val(formatAmount($('#project_furniture').val()));
}

function setOtheramount() {
	$('#project_other_amount').val(formatAmount($('#project_other_amount').val()));
}

function calculateAmount() {

	if (isNaN(parseFloat($('#project_equipments').val()))) {
		$('#project_equipments').val("0,00");
    	equipments = 0;
	} else {
		equipments = parseFloat($('#project_equipments').val().replace(/\./g, '').replace(",", "."))};

	if (isNaN(parseFloat($('#project_services').val()))){
		$('#project_services').val("0,00");
    	services = 0;
	} else {
		services = parseFloat($('#project_services').val().replace(/\./g, '').replace(",", "."))};

	if (isNaN(parseFloat($('#project_infrastructure').val()))) {
		$('#project_infrastructure').val("0,00");
    	infrastructure = 0;
	} else {
		infrastructure = parseFloat($('#project_infrastructure').val().replace(/\./g, '').replace(",", "."))};

	if (isNaN(parseFloat($('#project_hhrr').val()))) {
		$('#project_hhrr').val("0,00");
    	hhrr = 0;
	} else {
		hhrr = parseFloat($('#project_hhrr').val().replace(/\./g, '').replace(",", "."))};

	if (isNaN(parseFloat($('#project_consumables').val()))) {
		$('#project_consumables').val("0,00");
    	consumables = 0;
	} else {
		consumables = parseFloat($('#project_consumables').val().replace(/\./g, '').replace(",", "."))};

	if (isNaN(parseFloat($('#project_furniture').val()))) {
		$('#project_furniture').val("0,00");
    	furniture = 0;
	} else {
		furniture = parseFloat($('#project_furniture').val().replace(/\./g, '').replace(",", "."))};

	if (isNaN(parseFloat($('#project_other_amount').val()))) {
		$('#project_other_amount').val("0,00");
    	other_amount = 0;
	} else {
		other_amount = parseFloat($('#project_other_amount').val().replace(/\./g, '').replace(",", "."))};

	total = equipments + services + infrastructure + hhrr + consumables + furniture + other_amount;

	total = addPeriods(total.toFixed(2).toString().replace(".",","));

	$('#project_amount').val(total);

}

function formatAmount(n){
	if (n.toString().indexOf(",") == -1) {
		n = n.concat(",00");
	} 
	if (n.toString().indexOf(",") == n.toString().length-2) {
		n = n.concat("0");
	} 	
	return addPeriods(n);
}

function addPeriods(n){
    var rx=  /(\d+)(\d{3})/;
	var split = String(n).split(',');
	var integer = split[0];
	var decimals = split[1];
    return integer.replace(/^\d+/, function(w){
        while(rx.test(w)){
            w= w.replace(rx, '$1.$2');
        }
			return w;
    }).concat(",".concat(decimals));
}

function changeAnnulledDate() {

	if ($('#project_status').val()== "annulled") {
		$(".hidden_option1").fadeIn('fast');
	} else {
		$(".hidden_option1").fadeOut('fast');		
	}

}

function showButtons() {
    if(!$(".hidden_option").is(":visible")) {
		$(".hidden_option").fadeIn('fast');
     };

	$(".hidden_option").fadeIn('fast');
}