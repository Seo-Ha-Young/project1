package com.team4.project1.domain;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BasketVO {

	private Long b_no;
	private String u_id;
	private Long p_no;
	@Size(min = 1, max = 99999)
	private int quantity;
	@DateTimeFormat(pattern="yyyy/mm/dd")
	private Date b_regDate;
	private int totalPrice;
	private ProductVO productVO;
	
	public int getTotalPrice() {
		totalPrice = this.productVO.getPrice()*this.quantity;
		return totalPrice;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	private Map<String, BasketItemVO> basketItems;
//	
//	private int grandTotal;
//	
//	
//	public int getGrandTotal() {
//        return grandTotal;
//    }
//
//    public void updateGrandTotal() {
//        grandTotal = 0;
//        for (BasketItemVO item : basketItems.values()) {
//            grandTotal = grandTotal + item.getTotalPrice();
//        }
//    }
//    
//    public void addBasketItems(BasketItemVO item) {
//        String p_no = item.getProductVO().getP_no(); // 현재 등록하기 위한 상품 번호 가져오기
//
//        // 상품번호가가 basketItems 객체에 등록되어 있는지 여부 확인
//        if (basketItems.containsKey(p_no)) { 
//            BasketItemVO basketItem = basketItems.get(p_no); // 등록된 상품번호에 대한 정보 가져오기
//            // 등록된 도서 ID의 개수 추가 저장
//            basketItem.setQuantity(basketItem.getQuantity() + item.getQuantity()); 
//            basketItems.put(p_no, basketItem); // 등록된 상품번호에 대한 변경 정보(basketItem) 저장
//        } else {
//            basketItems.put(p_no, item); // p_no에 대한 상품 정보(item) 저장
//        }
//        updateGrandTotal(); // 총액 갱신
//    }
//    
//    public void removeCartItem(BasketItemVO item) {
//        String p_no = item.getProductVO().getP_no();
//        basketItems.remove(p_no);  //p_no 상품 삭제
//        updateGrandTotal();  //총액갱신
//    }
//    
//    @Override
//    public int hashCode() {
//        final int prime = 31;
//        int result = 1;
//        result = prime * result + ((b_no == null) ? 0 : b_no.hashCode());
//        return result;
//    }
//
//    @Override
//    public boolean equals(Object obj) {
//        if (this == obj)
//            return true;
//        if (obj == null)
//            return false;
//        if (getClass() != obj.getClass())
//            return false;
//        BasketVO other = (BasketVO) obj;
//        if (b_no == null) {
//            if (other.b_no != null)
//                return false;
//        } else if (!b_no.equals(other.b_no))
//            return false;
//        return true;
//    }
//
//	public int getQuantity() {
//		return quantity;
//	}
//
//	public void setQuantity(int quantity, BasketItemVO vo) {
//		quantity = vo.getQuantity();
//		this.quantity = quantity;
//	}
	
	
	    
}
