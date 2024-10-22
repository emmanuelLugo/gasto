package com.py.api.mapper.venda;

import java.util.List;

import com.py.api.model.entity.Venda;

public interface VendaMapper {

	List<Venda> findVendaSimplesByCondition(String condition);

}