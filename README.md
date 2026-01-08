__# Inventory Optimization using ABC–XYZ Analysis__

## Dataset

The dataset used in this project is publicly available on Kaggle:

- [Inventory Analysis Case Study Dataset](https://www.kaggle.com/datasets/bhanupratapbiswas/inventory-analysis-case-study/data)

## Project Overview

This project focuses on inventory optimization by integrating profitability (ABC analysis), demand variability (XYZ analysis), and stock status (Dead Stock).
The goal is to transform large-scale transactional data into actionable, decision-oriented insights for inventory management.

Using Python, the project recalculates product-level profitability, analyzes demand stability, and builds a decision matrix that supports strategic inventory actions such as protection, optimization, and discontinuation.

Please refer to the full explanation in Korean for details(자세한 설명은 아래 한국어 문서를 참고해 주세요.):
- [재고 최적화: ABC 및 XYZ 분석](https://www.notion.so/ABC-XYZ-273daa9f0aca810f8df8eda345afdd6a?source=copy_link)

## Key Objectives

Identify high-impact products driving the majority of profit
![ABC](figures/profit_and_qty_distribution_per_category.png)


Evaluate demand stability using coefficient of variation (CV)
![XYZ](figures/xyz_category_share.png)

Detect low-performing and dead stock products

Provide clear inventory action recommendations per SKU

## Tools & Methodologies

Python: pandas, numpy

Visualization: matplotlib, seaborn

## Methodologies:

ABC (Pareto) analysis based on profit contribution

XYZ analysis based on demand variability (CV)

Dead Stock identification (no sales over 12 months)

Decision Matrix (ABC × XYZ × Profitability)

## Key Outputs

Product-level profit recalculation accounting for price changes

ABC and XYZ categorization for all SKUs
![Decision_matrix](figures/Decision_matrix.png)

Decision matrix with actionable inventory strategies

Static analytical dashboards (Python)
![dashboard](figures/Dashboard.png)

Ready-to-extend structure for Tableau dashboards

## Future Work

Apply unsupervised learning (clustering) for deeper product segmentation

Build an interactive Tableau dashboard for store- and category-level inventory monitoring

## Repository Structure
├── notebooks/          # Analysis notebooks (EDA, ABC, XYZ, Decision Matrix)
├── figures/            # Generated charts and visualizations
├── sql_queries/        # SQL queries for pre analysis stage
├── outputs/            # interactive Tableau dashboard 
├── README.md
├── README 한국어.md    #프로젝트 설명

## Conclusion

This project demonstrates how combining profitability, demand behavior, and inventory data enables more efficient, scalable, and data-driven inventory management decisions.