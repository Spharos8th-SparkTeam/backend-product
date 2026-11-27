# backend-product API 정의서 (상품 서비스)

| 요구사항 이름 | HTTP 메소드 | Version | URI |
|---|---|---|---|
| 물품 종류 카테고리 조회 | GET | /api/v1 | /products/categories |
| 메인페이지 인기 상품 목록 조회 | GET | /api/v1 | /products/popular/main |
| 메인페이지 신상품 목록 조회 | GET | /api/v1 | /products/new/main |
| 인기 상품 목록 조회<br>(물품 종류, 국가, 판매 상태, 가격대 필터링 및 정렬) | GET | /api/v1 | /products/popular |
| 신상품 목록 조회<br>(물품 종류, 국가, 판매 상태, 가격대 필터링 및 정렬) | GET | /api/v1 | /products/new |
| 상품 목록 조회<br>(국가, 판매 상태, 가격대 필터링 및 정렬) | GET | /api/v1 | /products/categories/{categorieUUID} |
| 검색한 상품 목록 조회<br>(물품 종류, 국가, 판매 상태, 가격대 필터링 및 정렬) | GET | /api/v1 | /products?keyword={keyword} |
| 판매 상품 상세 조회 | GET | /api/v1 | /products/{productUuid} |
| 유저 판매중 상품 조회 (내 상점 판매중 상품 조회) | GET | /api/v1 | /products/{userUuid}/sell |
| 유저 판매 완료 상품 조회 (내 상점 판매 완료 상품 조회) | GET | /api/v1 | /products/{userUuid}/sold |
| 상품 등록 | POST | /api/v1 | /products |
| 상품 수정 | PUT | /api/v1 | /products/{productUuid} |
| 상품 상태 변경 | PATCH | /api/v1 | /products/{productUuid}/status |
| 시세 조회 | POST | /api/v1 | /products/price |
| 상품 찜 등록 | POST | /api/v1 | /products/{productUuid}/wishes |
| 상품 찜 취소 | DELETE | /api/v1 | /products/{productUuid}/wishes |
| 찜한 상품 목록 조회 | GET | /api/v1 | /products/wishes |
