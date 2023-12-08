package com.svs.etracker.model;

import java.util.Date;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.validator.constraints.NotEmpty;


@Entity
@XmlRootElement
@Cacheable(false)
public class Income {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int incomeId;

	@NotEmpty(message="Expense name cannot be empty")
	private String incomeName;

	@Min(1)
	private double amount;


	@Past(message="Date cannot be in the future")
	private Date createdDate;

	@Size(min=3, max=200, message = "comment size should be between {min} and {max}")
	private String comments;



	private int categoryId;

	private int imageId;

	public int getIncomeId() {
		return incomeId;
	}

	public void setIncomeId(int incomeId) {
		this.incomeId = incomeId;
	}

	public String getIncomeName() {
		return incomeName;
	}

	public void setIncomeName(String incomeName) {
		this.incomeName = incomeName;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public Income(int incomeId, String incomeName, double amount, Date createdDate, String comments, int categoryId,
			int imageId) {
		super();
		this.incomeId = incomeId;
		this.incomeName = incomeName;
		this.amount = amount;
		this.createdDate = createdDate;
		this.comments = comments;
		this.categoryId = categoryId;
		this.imageId = imageId;
	}

	public Income() {
		super();
	}


	












}