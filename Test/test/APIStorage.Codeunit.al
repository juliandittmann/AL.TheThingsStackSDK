codeunit 50106 "jdi TTS Test API Storage"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestEu1GetStorageWithHttp()
    var
        StorageAPI: Codeunit "jdi TTS API Storage";
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "jdi TTS Cluster Address";
        APIVersion: Enum "jdi TTS API GetStoredAppUp";
        Param: Dictionary of [Enum "jdi TTS Param GetStoredAppUp", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetStorage using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetStorageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsFalse(StorageAPI.GetStoredApplicationUp(Cluster::eu1, APIVersion::v3, Param, HttpResponse), 'TTS Rest API should not be StatusCode:200');

        //[Finally] Verify TTS response StatusCode
        Assert.AreEqual(401, HttpResponse.HttpStatusCode(), 'TTS Rest API should be StatusCode:401');
    end;

    [Test]
    procedure TestEu1GetStorageWithJson()
    var
        StorageAPI: Codeunit "jdi TTS API Storage";
        JResponse: JsonObject;
        ErrorToken: JsonToken;
        StatusCodeToken: JsonToken;
        MessageToken: JsonToken;


        Cluster: Enum "jdi TTS Cluster Address";
        APIVersion: Enum "jdi TTS API GetStoredAppUp";
        Param: Dictionary of [Enum "jdi TTS Param GetStoredAppUp", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetStorage using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetStorageParam(Param);

        //[Then] Verify TTS response  
        Assert.IsFalse(StorageAPI.GetStoredApplicationUp(Cluster::eu1, APIVersion::v3, Param, JResponse), 'TTS Rest API should not be StatusCode:200');

        //[Finally] Verify TTS response StatusCode
        Assert.IsTrue(JResponse.Get('error', ErrorToken), 'JResponse should contain error');

        Assert.IsTrue(ErrorToken.AsObject().Get('http_code', StatusCodeToken), 'JResponse should contain http_code');
        Assert.AreEqual(401, StatusCodeToken.AsValue().AsInteger(), 'TTS Rest API should be Response Code: 401');

        Assert.IsTrue(ErrorToken.AsObject().Get('message', MessageToken), 'JResponse should contain message');
        Assert.AreEqual(Message401Lbl, MessageToken.AsValue().AsText(), StrSubstNo('TTS Rest API should be %1', Message401Lbl));
    end;

    local procedure CreateGetStorageParam(var Param: Dictionary of [Enum "jdi TTS Param GetStoredAppUp", Text])
    var
        GetStorageParam: Enum "jdi TTS Param GetStoredAppUp";
    begin
        Clear(Param);
        Param.Add(GetStorageParam::AuthToken, InvalidAPIKey);
        Param.Add(GetStorageParam::application_ids, ApplicationId);
        Param.Add(GetStorageParam::end_device_ids, DeviceId);
        Param.Add(GetStorageParam::type, 'uplink_message');
    end;

    local procedure Inizialize()
    var
        TTSMgt: Codeunit "jdi TTS App Mgt.";
    begin
        if IsInitialized then
            exit;

        TTSMgt.EnableWebserviceCallsInSandbox();
        IsInitialized := true;
    end;


    var

        Assert: Codeunit "Library Assert";
        LibraryLowerPermissions: Codeunit "Library - Lower Permissions";
        InvalidAPIKey: Label 'NNSXS.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', Locked = true;
        ApplicationId: Label 'jdi-test-app', Locked = true;
        DeviceId: Label 'eui-9876b60000119dcc', Locked = true;
        Message401Lbl: Label 'error:pkg/identityserver:api_key_not_found (API key not found)', Locked = true;
        IsInitialized: Boolean;
}