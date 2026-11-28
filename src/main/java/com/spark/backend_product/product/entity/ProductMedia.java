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

import java.time.LocalDateTime;

@Entity
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductMedia extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long productMediaId;

    @Column(name = "product_uuid", nullable = false, length = 36)
    private String productUuid;

    @Column(name = "thumbnailed", nullable = false)
    private boolean thumbnailed;

    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder;

    @Column(name = "file_type", nullable = false, length = 20)
    private String fileType;

    @Column(name = "file_name", nullable = false)
    private String fileName;

    @Column(name = "file_size", nullable = false)
    private Long fileSize;

    @Column(name = "deleted_at")
    private LocalDateTime deletedAt;
}
