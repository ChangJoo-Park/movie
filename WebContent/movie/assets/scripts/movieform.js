function deletecheck(){
	ok = confirm("삭제하시겠습니까?");
	if(ok){
		document.movieform.menu.value='delete';
		document.movieform.submit();
	}else{
		return;
	}
}

function insertcheck(){
	document.movieform.menu.value='insert';
	document.movieform.submit();
}

function updatecheck(){
	document.movieform.menu.value='update';
	document.movieform.submit();	
}