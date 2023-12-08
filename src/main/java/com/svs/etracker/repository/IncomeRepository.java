package com.svs.etracker.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.svs.etracker.model.Expense;
import com.svs.etracker.model.Income;
@Repository
public interface IncomeRepository extends CrudRepository<Income, Integer>{
	
	@Query("SELECT i.incomeName, i.amount, i.createdDate, i.comments, i.incomeId, c.category FROM Income i, Category c WHERE c.categoryId = i.categoryId AND i.createdDate BETWEEN :fromDate AND :tillDate")
	public List<Object[]> getIncomeByDate(@Param("fromDate") Date fromDate, @Param("tillDate") Date tillDate);

	@Query("SELECT i.incomeName, i.amount, i.createdDate, i.comments, i.incomeId, c.category FROM Income i, Category c WHERE c.categoryId = i.categoryId AND i.categoryId = :categoryId")
	public List<Object[]> getIncomeByCategory(@Param("categoryId") int categoryId);

	@Query("SELECT i.incomeName, i.amount, i.createdDate, i.comments, i.incomeId, c.category FROM Income i, Category c WHERE c.categoryId = i.categoryId AND i.categoryId = :categoryId AND i.createdDate BETWEEN :fromDate AND :tillDate")
	public List<Object[]> getIncomeByCategoryAndDate(@Param("fromDate") Date fromDate, @Param("tillDate") Date tillDate, @Param("categoryId") int categoryId);

	
	
}
