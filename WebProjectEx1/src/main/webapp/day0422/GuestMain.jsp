<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <meta name="viewport" content="width=device-width;initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <style type="text/css">
       div.header{
          width: 95%;
          height: 110px;
          line-height: 110px;
          text-align: center;
          font-size: 35px;
          font-family: 'Lobster';
          font-weight: bold;
          border: 10px solid gold;
         margin-bottom: 30px;
       }
       
       div.all{
          width: 1150px;
       }
       
       div.inform{
          font-size: 20px;
          font-family: 'Jua';
          float: left;
          width: 500px;
          height: auto;
          border: 5px solid gray;
          padding: 20px 20px;
       }
       
       div.list{
          font-size: 20px;
          font-family: 'Jua';
          float: right;
          width: 600px;
          height: auto;
          border: 5px solid gray;
          padding: 20px 20px;
       }
       
       img.imgphoto{
          width: 55px;
          height: 55px;
          margin-left: 3px;
          cursor: pointer;
       }
       
       .select{
          border: 2px solid black;
          box-shadow: 3px 3px 3px gray;
       }
       
       span.mod,span.del{
          margin-left: 10px;
          cursor: pointer;
       }
       span.day{
          float: right;
          color: #999;
          font-size: 13px;
       }
       
       img.avata{
          width: 80px;
       }
    </style>
    <script type="text/javascript">
       $(function(){
          list();   // 처음 시작시 목록 출력하기
          
          $(".btnsave").click(function(){
             // 폼 전체 데이타를 읽어서 insert.jsp로 보내고
             var fdata=$("#frm").serialize();
             // 성공 후 list()를 다시 호출 후, 입력값 초기화
             $.ajax({
                // console.log(1); 잘나오는지 확인
                type:"post",
                dataType:"html",
                url:"insert.jsp",
                data:fdata,
                success:function(){
                   alert("추가성공");
                
                   list();
                
                   $("#writer").val("");
                   $("#pass").val("");
                   $("#content").val("");
                   
                   $("#avata").val("1");
                   $("img.imgphoto").removeClass("select");
                   $("img.imgphoto:first").addClass("select");
                }
             });
          });
          
          // 삭제 이벤트 주는 코드
          $(document).on("click","span.del",function(){
             var num=$(this).attr("num");   // avata를 가져오는거임. avata값은 숫자니까
             
             // 비번은 입력
             var pass=prompt("이 글에대한 비밀번호를 입력해주세요");
             console.log(num+","+pass);
             
             // 취소를 클릭하거나 비번을 입력하지 않았을 경우 함수 종료
             if(pass==null || pass.length==0){
                return;
             }
             $.ajax({
                type:"get",
                dataType:"json",
                data:{"num":num,"pass":pass},
                url:"delete.jsp",
                success:function(data){
                   if(data.result=='true'){
                      alert("삭제되었습니다");
                      location.reload();
                   }else{
                      alert("비번이 맞지 않습니다")
                   }
                }
             });
          });
          
          // 수정 이벤트 주는 코드
          $(document).on("click","span.mod",function(){
             var num=$(this).attr("num");   // avata를 가져오는거임. avata값은 숫자니까
             
             // 비번은 입력
             var pass=prompt("이 글에대한 비밀번호를 입력해주세요");
             
             // 취소를 클릭하거나 비번을 입력하지 않았을 경우 함수 종료
             if(pass==null || pass.length==0){
                return;
             }
             $.ajax({
                type:"get",
                dataType:"json",
                data:{"num":num,"pass":pass},      // db가서 비교해야되면 이렇게
                url:"equalpass.jsp",
                success:function(data){
                   if(data.result=='true'){
                      // 비번이 맞으면 수정폼으로 이동하기
                      location.href='updateForm.jsp?num='+num;
                   }else{
                      alert("비번이 맞지 않습니다")
                   }
                }
             });
          });
          
          
       });   // $functon close
       
       
       
       function list(){
          $.ajax({
             type:"get",
             dataType:"json",
             url:"list.jsp",
             success:function(data){
                var s="";
                $.each(data, function(i, elt) {
                   s+="<table class='table'>";
                   s+="<tr><td>";
                   s+="<b>"+elt.writer+"</b>";      // b태그로 진하게
                   s+="<span class='mod' num="+elt.num+">수정</span>";
                   s+="<span class='del' num="+elt.num+">삭제</span>";
                  s+="<span class='day'>"+elt.writeday+"</span>";
                   s+="</td></tr>";      
                   
                   s+="<tr><td>";
                   s+="<img src='../avata/s"+elt.avata+".JPG' class='avata' align=left hspace=20>";
                      // hspace 이미지 옆에 들어가는 공백
                   s+="<pre>"+elt.content+"</pre>";   // pre는 지금 나오는 형식으로 기본 설정 되어있음
                      
                   s+="</td></tr>";
                   s+="</table><br><br>";
                });
                
                $("div.list").html(s);
             }
          });
       }
    </script>
</head>
<body>

   <div class="header">
      Guest Ajax Test
   </div>
   <div class="all">
      <div class="inform">
         <form id="frm" class="form-inline">
            <table class="table">
               <tr>
                  <td width="350">
                     작성자 : <input type="text" id="writer" name="writer" class="from-control" style="width: 100px;">
                     비 번 : <input type="text" id="pass" name="pass" class="from-control" style="width: 100px;">
                  </td>
                  <td rowspan="3" style="cursor: pointer; background-color: orange;" align="center" 
                  valign="middle" class="btnsave">
                     저장
                  </td>
               </tr>
               <tr>
                  <td>
                     <textarea id="content" name="content" style="width: 100%; height: 80px;"></textarea>
                  </td>
               </tr>
               <tr>
                  <td>
                     <input type="hidden" id="avata" name="avata" value="1"><br>
                     <%
                        for(int i=1;i<=10;i++){%>
                           <img src="../avata/s<%=i%>.JPG" class="imgphoto" idx="<%=i%>">
                        <%
                           if(i==5){%>
                              <br>
                           <%}
                        }
                     %>
                     <script type="text/javascript">
                        // 첫번째 이미지에 .select 적용
                        $("img.imgphoto").eq(0).addClass("select");         // 작은 사진중에 index으로 0번째에 있는 애한테 class를 추가할꺼야 select라는 클래스를.
                        // 아바타 클릭시 idx값을 얻어서 #avata에 출력
                        // 클릭한 이미지에만 .select가 적용되도록 하기
                        $("img.imgphoto").click(function(){               
                           $(this).siblings().removeClass("select");      // 사진을 클릭하면 자신을 제외한 다른 사진에 있는 select클래스를 지울꺼야
                           $(this).addClass("select");                  // 클릭한 사진에 select클래스를 추가할꺼야
                           $("#avata").val($(this).attr("idx"));         // hidden으로 숨겨진 avata라는 id를 가진 입력창에 지금 클릭한 사진의 idx(인덱스)로 변경할꺼야 
                        });
                     
                        
                     </script>
                  </td>
               </tr>
            </table>
         </form>
      </div>
      <div class="list">
         123
      </div>
   </div>



</body>
</html>


















































