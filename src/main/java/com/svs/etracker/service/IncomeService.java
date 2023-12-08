package com.svs.etracker.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.svs.etracker.model.Expense;
import com.svs.etracker.model.Income;
import com.svs.etracker.repository.CategoryRepository;
import com.svs.etracker.repository.ExpenseRepository;
import com.svs.etracker.repository.IncomeRepository;


@Service
public class IncomeService {

	@Autowired
	private IncomeRepository incomeRepository;

	@Autowired
	private CategoryRepository categoryRepository;

	public void addIncome(Income expense){
		incomeRepository.save(expense);
	}

	public List<Object[]> getbydate(Date fromDate, Date tillDate) {
		return incomeRepository.getIncomeByDate(fromDate, tillDate);

	}

	public List<Object[]> getbyCategory(String category) {
		int categoryId = categoryRepository.getIdForCategory(category);

		return incomeRepository.getIncomeByCategory(categoryId);

	}
	public List<Object[]> getByCategoryAndDate(Date fromDate, Date tillDate, String category){
		int categoryId = categoryRepository.getIdForCategory(category);
		return incomeRepository.getIncomeByCategoryAndDate(fromDate, tillDate, categoryId);
	}

	public Income getIncomeById(int incomeId){
		return incomeRepository.findOne(incomeId);
	}

	public void deleteExpenses(int[] ids){
		for (int i : ids) {
		incomeRepository.delete(i);
		}
	}

}
