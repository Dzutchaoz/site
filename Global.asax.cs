using System.Web.UI;

public class Global : HttpApplication
{
    void Application_Start(object sender, EventArgs e)
    {
        // Mapeamento para jQuery
        ScriptResourceDefinition jqueryDefinition = new ScriptResourceDefinition();
        // Ajuste o caminho se a versão for diferente
        jqueryDefinition.Path = "~/js/jquery-3.6.0.min.js";
        jqueryDefinition.DebugPath = "~/js/jquery-3.6.0.js";
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery", null, jqueryDefinition);
    }
}