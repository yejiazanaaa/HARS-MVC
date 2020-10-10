package util;

import util.threadlocal.LocalRequestContextHolder;

public class Request {
    static public String get(String name)
    {
        String value = LocalRequestContextHolder.getLocalRequestContext().getRequest().getParameter(name);
        return value == null ? "" : value;
    }

    static public String get(String name, String def)
    {
        if(def == null)
        {
            def = "";
        }
        String value = LocalRequestContextHolder.getLocalRequestContext().getRequest().getParameter(name);
        return value == null ? def : value;
    }
}
