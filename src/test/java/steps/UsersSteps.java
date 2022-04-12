package steps;

import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.Entao;
import io.cucumber.java.pt.Quando;
import org.junit.Assert;
import utils.RestUtils;

import java.util.Map;

public class UsersSteps {
    Map<String, String> mapDados;
    String id = "";

    @Dado("que sejam preenchidos os valores de users com")
    public void queSejamPreenchidosOsValoresDeUsersCom(Map<String, String> map) {
        mapDados = map;
    }

    @Dado("que seja utilizado o id {string}")
    public void queSejaUtilizadoOId(String id) {
        this.id = id;
    }

    @Quando("realizado o POST do Users")
    public void realizadoOPOSTDoUsers() {
        RestUtils.postRequest("https://reqres.in/api/users", mapDados);
    }

    @Quando("realizado o Get do Users")
    public void realizadoOGetDoUsers() {
        RestUtils.getRequest("https://reqres.in/api/users/"+this.id);
    }

    @Quando("realizado o PATCH do Users com o id {int}")
    public void realizadoOPATCHDoUsersComOId(int id) {
        RestUtils.patchRequest("https://reqres.in/api/users/"+id, mapDados);
    }

    @Entao("o sistema devolve o status {int}")
    public void oSistemaDevolveOStatus(int status) {
        Assert.assertEquals(status, RestUtils.getStatusCode());
    }

    @Entao("o campo {string} retorna o valor {string}")
    public void oCampoRetornouOValor(String key, String value) {
        Assert.assertEquals(value, RestUtils.getResponse(key));
    }

    @Entao("o campo {string} retorna o valor {int}")
    public void oCampoRetornouOValor(String key, int value) {
        Assert.assertEquals(value, RestUtils.getResponse(key));
    }
}
