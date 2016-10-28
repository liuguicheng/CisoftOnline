package com.cisoft.action;

import java.util.HashMap;
import java.util.Map;

public class BaseAction {
	   public static final String RESULT = "result";
	    protected boolean timeout = false;
	    protected Map<String, Object> result = new HashMap<String, Object>();

	    public void setTimeout(boolean timeout) {
	        this.timeout = timeout;
	    }    

	    public Map<String, Object> getResult() {
	        return result;
	    }
}
