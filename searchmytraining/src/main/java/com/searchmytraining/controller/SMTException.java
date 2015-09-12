package com.searchmytraining.controller;

public class SMTException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SMTException()

	{

	}

	public SMTException(String message)

	{

		super(message);

	}

	public SMTException(Throwable cause)

	{

		super(cause);

	}

	public SMTException(String message, Throwable cause)

	{

		super(message, cause);

	}

	public SMTException(String message, Throwable cause,

	boolean enableSuppression, boolean writableStackTrace)

	{

		super(message, cause, enableSuppression, writableStackTrace);

	}

}
