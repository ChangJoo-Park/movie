function deletecheck(){
	ok = confirm("�����Ͻðڽ��ϱ�?");
	if(ok){
		document.memberform.menu.value='delete';
		document.memberform.submit();
	}else{
		return;
	}
}

function insertcheck(){
	document.memberform.menu.value='insert';
	document.memberform.submit();
}

function updatecheck(){
	document.memberform.menu.value='update';
	document.memberform.submit();	
}