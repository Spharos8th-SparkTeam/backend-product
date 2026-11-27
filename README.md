# backend-product

ReSpark(글로벌 완구 중고거래 플랫폼)의 **상품 서비스**입니다. MSA 구조에서 상품 도메인을 담당합니다.

## 프로젝트 소개 및 목적

- 중고 완구 상품의 등록, 조회, 수정, 삭제와 카테고리, 찜 기능을 제공한다.
- 다른 서비스와는 각 서비스가 제공하는 API로만 통신한다.

## 주요 기능

기능 명세와 API 정의는 `docs`를 기준으로 한다.

- 상품 등록 / 수정 / 삭제 / 상세 조회
- 상품 목록 조회, 검색, 정렬(최신, 인기, 저가, 고가), 필터(가격대, 판매 상태)
- 메인페이지 신상품 / 인기상품 조회
- 카테고리 관리 (1차: 물품 종류, 2차: 국가)
- 상품 찜 등록 / 취소 / 목록 조회
- 대표 이미지 AI 감지 기반 시세 조회

> 현재는 서비스 기본 환경 설정 단계이며, 위 기능은 순차적으로 구현한다.

## 기술 스택

| 영역 | 기술 |
| :--- | :--- |
| 언어 / 프레임워크 | Java 17, Spring Boot 4.0.10 |
| 빌드 | Gradle |
| 데이터베이스 | MySQL, Spring Data JPA |
| 보안 | Spring Security, JWT (jjwt 0.12.6) |
| API 문서 | springdoc-openapi (Swagger UI) |
| 기타 | Lombok |
| CI/CD | GitHub Actions, Docker |

## MSA 서비스 구성 및 역할

| 서비스 | 역할 |
| :--- | :--- |
| backend-user | 회원 |
| **backend-product** | **상품 (현재 서비스)** |
| backend-purchase-delivery | 구매 & 배송 |
| backend-chat | 채팅 |
| backend-payment | 결제 |
| backend-settlement | 정산 |
| backend-utility | 알림, 게시판 등 |

전체 구성은 [`docs/project-overview.md`](docs/project-overview.md)를 참고한다.

## 디렉터리 구조

```
backend-product
├── .github/workflows/        # CI/CD (GitHub Actions)
├── docs/
│   ├── project-overview.md   # 아키텍처 개요
│   ├── feature-spec.md       # 기능 명세서
│   ├── api-spec.md           # API 정의서
│   └── schema.sql            # DB 스키마
└── src/main/java/com/spark/backend_product/
    ├── BackendProductApplication.java
    └── common/
        ├── config/           # SwaggerConfig
        ├── entity/           # BaseEntity (createdAt, updatedAt)
        └── error/            # 공통 예외 처리
```

### 공통 에러 처리 (`common/error`)

| 클래스 | 역할 |
| :--- | :--- |
| `ErrorCode` | HTTP 상태, 에러 코드, 메시지 정의 |
| `ErrorResponseDto` | 에러 응답 바디 (`timestamp`, `status`, `code`, `message`) |
| `BusinessException` | 비즈니스 예외 |
| `CustomSecurityException` | 보안 관련 예외 |
| `GlobalExceptionHandler` | 예외를 `ErrorCode` 기반 응답으로 변환 |
| `CustomAuthenticationEntryPoint` | 인증 실패(401) 응답 |
| `CustomAccessDeniedHandler` | 권한 없음(403) 응답 |

## 실행 방법

### 사전 준비

- JDK 17
- MySQL (로컬 `localhost:3306`, 데이터베이스 `product`)

### 실행

```bash
# Windows
gradlew.bat bootRun

# macOS / Linux
./gradlew bootRun
```

- 서버 포트: `8080`
- Swagger UI: `http://localhost:8080/swagger-ui/index.html`
- DB 접속 정보는 `src/main/resources/application.yaml`의 로컬 설정을 따른다.

### 빌드 및 테스트

```bash
./gradlew build
```

## 협업 및 Git 브랜치 전략

- 브랜치는 `main`(배포) / `develop` / `feature` 로 구성한다.
- 작업 브랜치 이름은 `feature/{이슈번호}-{작업내용}` 형식이다. 예: `feature/1-init`
- 이슈를 먼저 생성한 뒤 `develop`에서 브랜치를 만들고, 작업 완료 후 `develop`으로 PR을 요청한다.
- 커밋 메시지는 `타입: 요약` 형식이다. 예: `feat: add error handling`
