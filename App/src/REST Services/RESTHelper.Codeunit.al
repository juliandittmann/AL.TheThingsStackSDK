codeunit 52408 "jdi TTS REST Helper"
{
    Access = Public;

    procedure InvokeWebRequest(Url: Text; pKey: Text; var Response: HttpResponseMessage): Boolean
    var
        Client: HttpClient;
    begin
        Client.DefaultRequestHeaders.Clear();
        Client.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + pKey);
        exit(Client.Get(Url, Response));
    end;

    procedure ProcessHttpResponseMessage(Response: HttpResponseMessage; var ResponseJObject: JsonObject): Boolean;
    var
        Result: Text;
    begin
        Clear(ResponseJObject);
        if Response.Content().ReadAs(Result) then
            ResponseJObject.ReadFrom(Result);

        exit(Response.IsSuccessStatusCode());
    end;
}