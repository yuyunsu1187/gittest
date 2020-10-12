package devonframe.sample.office.function.log.model;


public class LogDb {

    private String logNum;

    private String theadName;

    private String logTimestamp;

    private String message;

    private String loggerName;

    private String logLevel;

    private String callerFilename;

    private String callerClass;

    private String callerMethod;
    
    private String callerLine; 
    
    private String exception;

    /**
     * @return the logNum
     */
    public String getLogNum() {
        return logNum;
    }

    /**
     * @param logNum the logNum to set
     */
    public void setLogNum(String logNum) {
        this.logNum = logNum;
    }

    /**
     * @return the theadName
     */
    public String getTheadName() {
        return theadName;
    }

    /**
     * @param theadName the theadName to set
     */
    public void setTheadName(String theadName) {
        this.theadName = theadName;
    }

    /**
     * @return the logTimestamp
     */
    public String getLogTimestamp() {
        return logTimestamp;
    }

    /**
     * @param logTimestamp the logTimestamp to set
     */
    public void setLogTimestamp(String logTimestamp) {
        this.logTimestamp = logTimestamp;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the loggerName
     */
    public String getLoggerName() {
        return loggerName;
    }

    /**
     * @param loggerName the loggerName to set
     */
    public void setLoggerName(String loggerName) {
        this.loggerName = loggerName;
    }

    /**
     * @return the logLevel
     */
    public String getLogLevel() {
        return logLevel;
    }

    /**
     * @param logLevel the logLevel to set
     */
    public void setLogLevel(String logLevel) {
        this.logLevel = logLevel;
    }

    /**
     * @return the callerFilename
     */
    public String getCallerFilename() {
        return callerFilename;
    }

    /**
     * @param callerFilename the callerFilename to set
     */
    public void setCallerFilename(String callerFilename) {
        this.callerFilename = callerFilename;
    }

    /**
     * @return the callerClass
     */
    public String getCallerClass() {
        return callerClass;
    }

    /**
     * @param callerClass the callerClass to set
     */
    public void setCallerClass(String callerClass) {
        this.callerClass = callerClass;
    }

    /**
     * @return the callerMethod
     */
    public String getCallerMethod() {
        return callerMethod;
    }

    /**
     * @param callerMethod the callerMethod to set
     */
    public void setCallerMethod(String callerMethod) {
        this.callerMethod = callerMethod;
    }

	/**
	 * @return the callerLine
	 */
	public String getCallerLine() {
		return callerLine;
	}

	/**
	 * @param callerLine the callerLine to set
	 */
	public void setCallerLine(String callerLine) {
		this.callerLine = callerLine;
	}

	/**
	 * @return the exception
	 */
	public String getException() {
		return exception;
	}

	/**
	 * @param exception the exception to set
	 */
	public void setException(String exception) {
		this.exception = exception;
	}

}
