package com.team4.project1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team4.project1.domain.ProductImageVO;
import com.team4.project1.domain.ProductVO;
import com.team4.project1.mapper.ProductImageMapper;
import com.team4.project1.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private ProductImageMapper imageMapper;
	@Override
	public List<ProductVO> getList() {
		log.info("get list");

		List<ProductVO> list =  mapper.getList();
		
		list.forEach(product -> {
			
			Long pno = product.getP_no();
			
			List<ProductImageVO> imageList = imageMapper.getImageList(pno);
			
			product.setImageVO(imageList);
			log.info(imageList);

		});
		log.info(list);
		return list;
	}
	@Override
	public List<ProductVO> getP_no(Long p_no) {
		log.info("get p_no");
		return mapper.getP_no(p_no);
	}
	@Transactional
	@Override
	public void register(ProductVO productVO) {
		log.info("register : "+productVO);
		mapper.insertSelectKey(productVO);
		if(productVO.getImageVO() == null || productVO.getImageVO().size() <= 0) {
			return;
		}
		productVO.getImageVO().forEach(image -> {
			image.setP_no(productVO.getP_no());
			imageMapper.insert(image);
			log.info("image 내용: "+image);
		});
	}
	
	@Override
	public List<ProductImageVO> getImageList(Long p_no) {
		log.info("get image list by p_no"+p_no);
		return imageMapper.getImageList(p_no);
	}
	@Override
	public ProductVO getProductInfo(Long p_no) {
		log.info("p_no: "+p_no);
		ProductVO productInfo = mapper.getProductInfo(p_no);
		log.info("productInfo: "+productInfo);
		productInfo.setImageVO(imageMapper.getImageList(p_no));;
		return productInfo;
	}
	@Override
	public Long delete(Long p_no) {
		log.info("delete product "+p_no);
		log.info("삭제할 상품 이미지 정보: "+imageMapper.getImageList(p_no));
		imageMapper.deleteAll(p_no);
		return mapper.deleteP_no(p_no);
	}

}
