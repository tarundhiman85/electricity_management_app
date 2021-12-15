package project.Model;

import javax.persistence.*;

@Entity
public class Query {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int queryId;
    private String msg;
    private String Resolve;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    private User user;

    public Query(String msg, String resolve, User user) {
        this.msg = msg;
        Resolve = resolve;
        this.user = user;
    }

    public String getResolve() {
        return Resolve;
    }

    public void setResolve(String resolve) {
        Resolve = resolve;
    }

    public Query() {

    }

    public int getQueryId() {
        return queryId;
    }

    public void setQueryId(int queryId) {
        this.queryId = queryId;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
