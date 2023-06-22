package com.entities;

public class Message {
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	private String content;
	private String cssClass;
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Message(String content, String cssClass) {
		super();
		this.content = content;
		this.cssClass = cssClass;
	}
	
	
}
