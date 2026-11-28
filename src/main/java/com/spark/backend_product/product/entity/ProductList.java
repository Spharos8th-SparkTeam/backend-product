package com.spark.backend_product.product.entity;

import com.spark.backend_product.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductList extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long productListId;

    @Column(name = "seller_uuid", nullable = false, length = 36)
    private String sellerUuid;

    @Column(name = "category_uuid", nullable = false, length = 36)
    private String categoryUuid;

    @Column(name = "product_uuid", nullable = false, length = 36)
    private String productUuid;

    @Column(name = "status", nullable = false, length = 20)
    private String status;
}
