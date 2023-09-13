package kr.or.ddit.exception;

/**
 * Persistence Layer 에서 발생한 SQLException 의 wrapper[adapter] exception 
 *
 */
public class PersistenceException extends RuntimeException {

	public PersistenceException() {
		super();
	}

	public PersistenceException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public PersistenceException(String message, Throwable cause) {
		super(message, cause);
	}

	public PersistenceException(String message) {
		super(message);
	}

	public PersistenceException(Throwable cause) {
		super(cause);
	}

}
