package dao.db;

import java.sql.Connection;

public class Mysql extends Builder {
    public Mysql(Connection connect)
    {
        super(connect);
    }
}
