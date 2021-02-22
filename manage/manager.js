
$(document).ready(function(){
	//업로드
	$("#menu_menu").click(function(){
		$(".mainDisplay").html("");
	})	
	
	$("#goods_upload").click(function(){
		$.ajax({
			type:"GET",
			url:"../manage/상품등록/상품등록화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	// 상품 정보 등록
	$("#goods_attr").click(function(){
		$.ajax({
			type:"GET",
			url:"../manage/상품정보등록/정보등록화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	//조회
	$("#search").click(function(){
		$.ajax({
			type:"GET",
			url:"../manage/상품조회/상품조회화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})




/*
$(document).ready(function(){
	$(".mainDisplay").delegate("#search_id_goods_id","click",function(){
		alert("aaaaaaas");
	})
})
*/


	$(".mainDisplay").delegate("#goods_search_id_submit","click",function(){
		var $goods_id = $("#search_id_goods_id").val();
		$.ajax({
			type:"GET",
			url:"../manage/상품조회/search_id.jsp",
			dataType:"text",
			data:{
				goods_id:$goods_id
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
	$(".mainDisplay").delegate("#goods_search_name_submit","click",function(){
		var $goods_name = $("#search_name_goods_name").val();
		$.ajax({
			type:"GET",
			url:"../manage/상품조회/search_name.jsp",
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
	
	$(".mainDisplay").delegate("#search_all","click",function(){
		$.ajax({
			type:"GET",
			url:"../manage/상품조회/search_all.jsp",
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
	
	//삭제
	$("#goods_delete").click(function(){
		$.ajax({
			type:"GET",
			url:"../manage/상품삭제/상품삭제화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})
	
	//게시글
	$("#notice_boards").click(function(){
		$.ajax({
			type:"GET",
			url:"../manage/게시글/게시글화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})	
	

	$(".mainDisplay").delegate("#all_posts_view","click",function(){
		$.ajax({
			type:"GET",
			url:"../manage/게시글/notice_board_view.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$div = make_goods_information_views(data);
				$("#all_posts").html($div);
				
			}
		})
	})

	
	//결제
	$("#goods_payment").click(function(){
		$.ajax({
			type:"GET",
			url:"../manage/상품결제/상품결제화면.txt",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$(".mainDisplay").html(data);
			}
		})
	})	
	
	//거래내역
	
	$("#sales_history").click(function(){
		$.ajax({
			type:"GET",
			url:"../manage/매출기록/sales_history.jsp",
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
	
	//매출 기록
/*	$(".mainDisplay").delegate("#sales_history_submit","click",function(){
		$.ajax({
			type:"GET",
			url:"../manage/매출기록/sales_history.jsp",
			dataType:"text",
			error:function(){
				alert("통신실패!!")
			},
			success:function(data){
				$div = make_goods_information_views(data);
				$("#all_sales").html($div);
				
			}
		})
	})
*/	
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
