function deletecheck(){
	ok = confirm("�����Ͻðڽ��ϱ�?");
	if(ok){
		document.seatform.menu.value='delete';
		document.seatform.submit();
	}else{
		return;
	}
}

function insertcheck(){
	document.seatform.menu.value='insert';
	document.seatform.submit();
}

function updatecheck(){
	document.seatform.menu.value='update';
	document.seatform.submit();	
}