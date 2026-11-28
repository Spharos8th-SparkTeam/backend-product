# Respark 아키텍처 개요

> 글로벌 완구 중고거래 플랫폼 · MSA 구조

---

## 1. 시스템 구성 한눈에 보기

```
            [ Frontend: 유저 / 관리자 페이지 (E) ]
                           │
                  [ Gateway (A) ] ── [ Eureka (A) ]
                           │              │
     ┌─────────┬───────────┼──────────┬───┴─────┬───────────┐
     ▼         ▼           ▼          ▼         ▼           ▼
   user     product   purchase-    chat     payment     utility
   (B)       (C)      delivery(D)   (D)      (A)         (미정)
 Hexagonal  Redis                  NoSQL    Kafka     알림/게시판
                                            └ settlement 모듈(C)

            [ Config Repo (A) ]  ← 전 서비스 설정 관리
```

---

## 2. 공통 및 인프라

| 구분 | 세부 항목 | 담당 | 비고 |
| :--- | :--- | :---: | :--- |
| 팀 레포 | 룰 파일, 깃 템플릿 | 공통 | |
| 인프라 | Gateway, Eureka | A | |
| 백엔드 Config | 설정 관리 레포지토리 | A | |

## 3. 프론트엔드

| 구분 | 담당 |
| :--- | :---: |
| 유저 / 관리자 페이지 | E |

---

## 4. 백엔드 서비스별 R&R 및 기술 스택

| # | 서비스 | 담당 | 기술 / 특이사항 |
| :-: | :--- | :-: | :--- |
| 1 | backend-user | B | Hexagonal Architecture |
| 1-1 | └ 멤버십 | 미정 | 회원 하위 도메인 |
| 1-2 | └ 신고 & 제한 | 미정 | 회원 하위 도메인 |
| 1-3 | └ 관리자 | 미정 | 회원 하위 도메인 |
| 2 | backend-product | C | Redis 활용 |
| 3 | backend-purchase-delivery | D | |
| 4 | backend-chat | D | NoSQL 활용 (MongoDB 설계) |
| 5 | backend-payment | A | Kafka 활용 |
| 6 | backend-settlement | C | 결제 서비스 내 모듈로 분리 |
| 7 | backend-utility | 미정 | 알림, 게시판 등 (리뷰 포함 미정) |

---

## 5. 서비스별 주요 책임

### backend-user (B)
- 소셜 / 이메일 회원가입·로그인, 이메일 인증, 약관 동의
- 회원 탈퇴
- 비밀번호 찾기, 프로필 조회/편집
- 하위 도메인: 멤버십, 신고·제한(정지), 관리자 계정(등록·인증·삭제·권한), 회원 관리(조회·검색)

### backend-product (C)
- 상품 등록 / 수정 / 삭제 / 상세 조회
- 상품 목록·검색·정렬(최신/인기/저가/고가)·필터(가격대, 판매 상태), 메인 추천(신상품·인기상품)
- 카테고리(1차: 물품 종류 / 2차: 국가) 관리, 찜(인기순 집계)
- 대표 이미지 AI 감지 기반 시세 조회

### backend-purchase-delivery (D)
- 구매·판매 내역 조회/상세, 구매 확정, 거래 취소
- 배송 조회

### backend-chat (D)
- 1:1 채팅방 생성/나가기, 메시지 전송, 미디어 첨부
- 메시지 번역, 구매 요청/수락/결제 안내 자동 메시지

### backend-payment (A)
- 결제 페이지, 멤버십 적용
- PG / 에스크로 연동, 결제 취소 처리

### backend-settlement (C)
- 정산 요청/승인/조회/취소
- 판매자 계좌(예금주·은행 영문, 은행코드) 연동, 수수료 차감
- 정산 취소 시 PG사에 거래 취소 요청 전송

### backend-utility (미정)
- 게시판, 이용약관, 리뷰(작성/조회)

---

## 6. 기술 스택 요약

| 영역 | 기술 | 적용 위치 |
| :--- | :--- | :--- |
| 백엔드 | Spring (Java) | 전 서비스 |
| 아키텍처 | MSA, Hexagonal Architecture | 전체 / user |
| 서비스 디스커버리·진입점 | Eureka, Gateway | 인프라 |
| 설정 관리 | Config 레포지토리 | 인프라 |
| 캐시 | Redis | product |
| 메시징 | Kafka | alarm |
| NoSQL | MongoDB (채팅 메시지) | chat |
| 파일 저장 | AWS S3 (대표 이미지 임시 저장 등) | product |
| 외부 연동 | 소셜 로그인(Line, Google, X, Apple), PG/에스크로, AI 이미지 감지 API | user / payment·settlement / product |
| 번역 API | 후보: Google Cloud Translation, DeepL, Papago, Azure AI Translator (미확정) | chat |

---

## 7. 담당자별 요약 (R&R)

| 담당 | 역할 |
| :-: | :--- |
| A | 인프라(Gateway, Eureka), 백엔드 Config, 결제 |
| B | 회원(Hexagonal) |
| C | 상품(Redis), 정산 |
| D | 구매 & 배송, 채팅(NoSQL) |
| E | 프론트엔드 (유저 / 관리자) |
| 미정 | 회원 하위 기능(멤버십, 신고/제한, 관리자), 기타 서비스(리뷰, 게시판, 알림) |

---
