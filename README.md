# shoppingManagement
의류 등록, 결제, 재고관리 및 고객과 간단한 커뮤니티를 할 수 있는 상품관리 시스템
*Edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;eclipse*   
*Server&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;apache Tomcat*   
*DB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;MySQL*   
*front-end&nbsp;:&nbsp;HTML,CSS,JavaScript*   
*back-end&nbsp;&nbsp;:&nbsp;JSP*   
*ajax를 이용한 화면 일부 갱신*   
***

*folder manage : 관리자 기능*

*folder user   : 고객 기능*

*그림에 대한 설명은 그림 밑을 참고*

### 1. 프로젝트 개요
본 프로젝트는 의류 상점에서 관리자가 상품을 관리하고 고객이 상품을 조회하는 상품 관리 시스템을 개발을 목표로 한다. 관리자는 실시간으로 의류를 조회는 물론, 추가, 삭제 및 결제를 할 수 있다. 이벤트 공지는 게시판을 이용하여 공지할 수 있고, 매출 상황을 조회할 수 있다. 고객은 각 상품에 대해 조회하는 기능이랑 게시판을 확인할 수 있다. 그리고 추가로 고객은 각 상품에 대해 댓글을 작성할 수 있으며 댓글 확인도 가능하다. 관리자는 댓글에 대한 관리 권한을 가지고 있지 않다.

### 2. 시스템 구축 방향
데이터베이스 기반의 관리 시스템 구축

### 3. 업무 기능도
![엄무 기능도](https://user-images.githubusercontent.com/34391309/108698438-7a4e1f00-7547-11eb-831d-fe5fbe13e5f1.png)

### 4. DB
![image00003](https://user-images.githubusercontent.com/34391309/108699526-b3d35a00-7548-11eb-8ae7-abe6df3ea30b.png)

### 5. 구현 결과 (동작화면 및 DB 데이터 변화)
### 관리자 전체 화면
![image00004](https://user-images.githubusercontent.com/34391309/108699528-b3d35a00-7548-11eb-92ab-9aa79f1807c6.png)
관리자가 들어갈때 표현되는 화면, 각 기능들이 좌측화면에 나열되어 있다.

#### 1) 상품등록
![image00005](https://user-images.githubusercontent.com/34391309/108699530-b46bf080-7548-11eb-915f-f8a4aadcb517.png)
관리자 상품등록 기능이다.   
상품에 대한 정보를 입력하고 등록 버튼을 누르면 상품이 등록된다.   
***
![image00006](https://user-images.githubusercontent.com/34391309/108699531-b5048700-7548-11eb-8834-f18154b0f790.png)   
데이터가 저장된것을 확인할 수 있다. 
***

#### 2) 상품소개 등록
![image00007](https://user-images.githubusercontent.com/34391309/108699533-b59d1d80-7548-11eb-89fa-d87ae32c8001.png)   
상품에 대한 소개를 등록하는 기능   
***
![image00008](https://user-images.githubusercontent.com/34391309/108699538-b635b400-7548-11eb-8513-90e7f5996cfe.png)   
데이터가 저장된것을 확인할 수 있다.
***
#### 3) 상품 삭제
![image00009](https://user-images.githubusercontent.com/34391309/108699541-b635b400-7548-11eb-8bd6-dca63fad8b00.png)   
이미 등록되어 있는 상품을 삭제하는 기능   
***
![image00010](https://user-images.githubusercontent.com/34391309/108699542-b6ce4a80-7548-11eb-9e57-1462e534888b.png)
![image00011](https://user-images.githubusercontent.com/34391309/108699545-b766e100-7548-11eb-9c75-203f4f62efac.png)
![image00012](https://user-images.githubusercontent.com/34391309/108699546-b766e100-7548-11eb-870d-dfe0af3515b5.png)   
상품에 대한 정보가 삭제된것을 확인할 수 있다.
***
#### 4) 상품 결제
![image00013](https://user-images.githubusercontent.com/34391309/108699547-b7ff7780-7548-11eb-8752-31bb25211bfb.png)   
관리자가 상품번호를 입력하고 결제를 누르면 상품이 결제된다. 매출한 기록은 매출기록에 저장하게 된다.   
***
![image00014](https://user-images.githubusercontent.com/34391309/108699548-b8980e00-7548-11eb-8687-2feae2103964.png)
![image00015](https://user-images.githubusercontent.com/34391309/108699549-b930a480-7548-11eb-8793-7ca0879d3794.png)
![image00016](https://user-images.githubusercontent.com/34391309/108699551-b930a480-7548-11eb-8313-efbf1737c8f2.png)   
판매된 상품에 대한 정보가 없어진것과 매출기록이 생긴것을 확인할 수 있다.
***
#### 5) 매출 기록
![image00017](https://user-images.githubusercontent.com/34391309/108699554-b9c93b00-7548-11eb-9a45-a7cb3e66c902.png)   
매출기록 조회
***
#### 6) 상품 조회 
![image00018](https://user-images.githubusercontent.com/34391309/108699556-ba61d180-7548-11eb-8def-c657002522a8.png)   
전체 조회랑 단일 조회가 있다.
***
![image00019](https://user-images.githubusercontent.com/34391309/108699558-bafa6800-7548-11eb-9baf-ba7ad03748dc.png)   
전체 조회 화면
***
![image00020](https://user-images.githubusercontent.com/34391309/108699561-bb92fe80-7548-11eb-8ec9-d561bb521390.png)
상품 번호를 통한 조회 결과
***
![image00021](https://user-images.githubusercontent.com/34391309/108699564-bc2b9500-7548-11eb-8caf-b5395eac9199.png)   
상품 이름을 통한 조회 결과
***
#### 7) 게시판
![image00022](https://user-images.githubusercontent.com/34391309/108699566-bcc42b80-7548-11eb-9298-d8f3fc2078f9.png)
게시판을 이용해서 게시글을 올리는 기능
***
![image00023](https://user-images.githubusercontent.com/34391309/108699570-bd5cc200-7548-11eb-8bcc-5a25fd24bbfd.png)
게시글이 잘 저장된것을 확인할 수 있다.
***
![image00024](https://user-images.githubusercontent.com/34391309/108699573-bd5cc200-7548-11eb-8fda-4469b54ad4c0.png)
게시글을 조회하는 기능   
***

### 사용자 전체 화면
![image00025](https://user-images.githubusercontent.com/34391309/108699577-bdf55880-7548-11eb-94f1-a177ce9e3766.png)
사용자가 사용하는 전체화면
***
#### 1) 상품 조회
![image00026](https://user-images.githubusercontent.com/34391309/108699579-be8def00-7548-11eb-8fbf-736e6009a2ab.png)
상품을 조회하는 기능, 사품의 이름을 입력하면 이름에 해당되는 상품을 화면에 출력해준다.
***
![image00027](https://user-images.githubusercontent.com/34391309/108699581-bf268580-7548-11eb-9341-9adf062878f8.png)
조회 결과 화면
***
#### 2) 게시판
![image00028](https://user-images.githubusercontent.com/34391309/108699582-bfbf1c00-7548-11eb-91be-ed99f69af54d.png)
관리자가 남긴 게시글을 확인하는 기능
***
#### 3) 댓글 쓰기
![image00029](https://user-images.githubusercontent.com/34391309/108699588-c057b280-7548-11eb-807e-7d7d66c672fc.png)
구매한 상품에 대한 리뷰를 남기는 기능
***
![image00030](https://user-images.githubusercontent.com/34391309/108699592-c0f04900-7548-11eb-86d4-04f6a3f03878.png)
사용자의 댓글이 잘 저장된것을 확인할 수 있다.
***
#### 4) 댓글 확인
![image00031](https://user-images.githubusercontent.com/34391309/108699593-c188df80-7548-11eb-9d8a-2da83acf1272.png)
다른 사용자가 남긴 리뷰를 확인하는 기능
***
![image00032](https://user-images.githubusercontent.com/34391309/108699594-c2217600-7548-11eb-8be1-4410bdc7297b.png)
이름으로 조회하는 화면
***
![image00033](https://user-images.githubusercontent.com/34391309/108699597-c2ba0c80-7548-11eb-8df4-63afe192b07f.png)
전체 조회 화면 

# 배운점
###### 1. 데이터베이스에 대해 전반적으로 이해도가 높아졌다. 활용 측면에서 더 능숙해졌다.
# 느낀점
###### 1. 물리적 데이터 모델(ERD)을 얼마나 잘 설계하느냐에 따라 구현이 쉬워지고 어려워 질 수 있다.
# 아쉬운점
###### 1. 구현과정에서 보안 측면에서 생각을 해본적이 없었다.
