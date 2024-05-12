package karate;

import com.intuit.karate.junit5.Karate;

public class CrudUsersRunner {

    @Karate.Test
    Karate crudUsersRunner (){
        return Karate.run("crudusers").relativeTo(getClass());
    }

}
