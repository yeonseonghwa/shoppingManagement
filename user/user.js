
$(document).ready(function(){
	
	$("#menu_menu").click(function(){
		$(".mainDisplay").html("");
	})	
	
	
	//조회
	$("#search").click(function(){
		$.ajax({
			type:"GET",
			url:"../user/상품조회/상품조회화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})


	$(".mainDisplay").delegate("#goods_search_name_submit","click",function(){
		var $goods_name = $("#search_name_goods_name").val();
		$.ajax({
			type:"GET",
			url:"../user/상품조회/search_name.jsp",
			dataType:"text",
			data:{
				goods_name:$goods_name
			},
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$div = make_goods_information_views(data);
				$(".mainDisplay").html($div);
				
			}
		})
	})
	
	//게시글
	$("#notice_boards").click(function(){
		$.ajax({
			type:"GET",
			url:"../user/게시글/notice_board_view.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$div = make_goods_information_views(data);
				$(".mainDisplay").html($div);
			}
		})
	})
	
	//댓글
	$("#evaluation_upload").click(function(){
		$.ajax({
			type:"GET",
			url:"../user/댓글쓰기/댓글쓰기화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	
	
	$("#evaluation_view").click(function(){
		$.ajax({
			type:"GET",
			url:"../user/댓글확인/댓글확인화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!");
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	
	$(".mainDisplay").delegate("#evaluation_search","click",function(){
		var $goods_name = $("#evaluation_name").val();
		$.ajax({
			type:"GET",
			url:"../user/댓글확인/evaluation_search_name.jsp",
			dataType:"text",
			data:{
				goods_name:$goods_name
			},
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$div = make_goods_information_views(data);
				$(".mainDisplay").html($div);
			}
		})
	})
	
	$(".mainDisplay").delegate("#evaluation_search_all","click",function(){
		$.ajax({
			type:"GET",
			url:"../user/댓글확인/evaluation_search_all.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$div = make_goods_information_views(data);
				$(".mainDisplay").html($div);
			}
		})
	})
})




function make_goods_information_views(data){
	var myBooks = JSON.parse(data);

	var col = [];
    for (var i = 0; i < myBooks.length; i++) {
        for (var key in myBooks[i]) {
            if (col.indexOf(key) === -1) {
                col.push(key);
            }
        }
    }
    var table = document.createElement("table");
    var tr = table.insertRow(-1);
    for (var i = 0; i < col.length; i++) {
        var th = document.createElement("th");
        th.innerHTML = col[i];
        tr.appendChild(th);
    }
    for (var i = 0; i < myBooks.length; i++) {

        tr = table.insertRow(-1);

        for (var j = 0; j < col.length; j++) {
            var tabCell = tr.insertCell(-1);
            tabCell.innerHTML = myBooks[i][col[j]];
        }
    }
    return table;
}