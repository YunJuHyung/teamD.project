function pagenum(currentPage){
	const pnums = document.querySelectorAll('.ieach');
	pnums.forEach(function(item){
		console.log(item);
		/* item 번호가 현재 페이지 이면 글꼴 스타일을 다르게함. */
		if(item.innerHTML==currentPage) {    
			item.style.color = 'black';
			item.style.fontWeight = 'bold';
		}else{
			item.style.color = '#37966f';
		}
	});
	}