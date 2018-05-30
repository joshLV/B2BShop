package net.deepdragon.exceptions;

public class DataSourceDescriptorException extends RuntimeException{

	private static final long serialVersionUID = 5082299003855826096L;

	public DataSourceDescriptorException() {
		super();
	}

	public DataSourceDescriptorException(Throwable e) {
		super(e);
	}

	public DataSourceDescriptorException(String message) {
		super(message);
	}

	public DataSourceDescriptorException(String message,Throwable e) {
		super(message, e);
	}
}
