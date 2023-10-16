package com.team4.project1.domain;

import javax.validation.constraints.Size;

public class BasketItemVO {

	private ProductVO productVO;
	@Size(min = 1, max = 99999)
	private int quantity;
	private int totalPrice;

	public BasketItemVO() {
		super();
	}

	public BasketItemVO(ProductVO productVO) {
		super();
		this.productVO = productVO;
		this.quantity = 1;
		this.totalPrice = productVO.getPrice();
	}

	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
		this.updateTotalPrice();
	}


	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
		this.updateTotalPrice();
	}
	public int getTotalPrice() {
		return totalPrice;
	}

	public void updateTotalPrice() {
		totalPrice = this.productVO.getPrice() * this.quantity;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productVO == null) ? 0 : productVO.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BasketItemVO other = (BasketItemVO) obj;
		if (productVO == null) {
			if (other.productVO != null)
				return false;
		} else if (!productVO.equals(other.productVO))
			return false;
		return true;
	}



	}
