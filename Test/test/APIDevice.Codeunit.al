codeunit 50355 "jdi TTS Test API Device"
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestEu1GetDevicesWithHttp()
    var
        DeviceAPI: Codeunit "jdi TTS API Device";
        HttpResponse: HttpResponseMessage;

        Cluster: Enum "jdi TTS Cluster Address";
        APIVersion: Enum "jdi TTS API GetDevices";
        Param: Dictionary of [Enum "jdi TTS Param GetDevices", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetDevices using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetDevicesParam(Param);

        //[Then] Verify TTS response  
        Assert.IsFalse(DeviceAPI.GetDevices(Cluster::eu1, APIVersion::v3, Param, HttpResponse), 'TTS Rest API should not be StatusCode:200');

        //[Finally] Verify TTS response StatusCode
        Assert.AreEqual(401, HttpResponse.HttpStatusCode(), 'TTS Rest API should be StatusCode:401');
    end;

    [Test]
    procedure TestEu1GetDevicesWithJson()
    var
        DeviceAPI: Codeunit "jdi TTS API Device";
        JResponse: JsonObject;
        StatusCodeToken: JsonToken;
        MessageToken: JsonToken;

        Cluster: Enum "jdi TTS Cluster Address";
        APIVersion: Enum "jdi TTS API GetDevices";
        Param: Dictionary of [Enum "jdi TTS Param GetDevices", Text];
    begin
        // [Scenario] Invoke an invalid webserviceCall to TTS-GetDevices using the HttpResponse overload
        // [Given]  O365BusFull Permissions
        Inizialize();

        //Using permissions that do not include SUPER
        LibraryLowerPermissions.SetO365BusFull();

        //[Then] Create Parameter    
        CreateGetDevicesParam(Param);

        //[Then] Verify TTS response  
        Assert.IsFalse(DeviceAPI.GetDevices(Cluster::eu1, APIVersion::v3, Param, JResponse), 'TTS Rest API should not be StatusCode:200');

        //[Finally] Verify TTS response StatusCode
        Assert.IsTrue(JResponse.Get('code', StatusCodeToken), 'JResponse should contain statusCode');
        Assert.AreEqual(16, StatusCodeToken.AsValue().AsInteger(), 'TTS Rest API should be Response Code:16');

        Assert.IsTrue(JResponse.Get('message', MessageToken), 'JResponse should contain message');
        Assert.AreEqual(Message401Lbl, MessageToken.AsValue().AsText(), StrSubstNo('TTS Rest API should be %1', Message401Lbl));
    end;

    local procedure CreateGetDevicesParam(var Param: Dictionary of [Enum "jdi TTS Param GetDevices", Text])
    var
        GetDevicesParam: Enum "jdi TTS Param GetDevices";
    begin
        Clear(Param);
        Param.Add(GetDevicesParam::AuthToken, InvalidAPIKey);
        Param.Add(GetDevicesParam::ApplicationID, ApplicationId);
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
        Message401Lbl: Label 'error:pkg/identityserver:api_key_not_found (API key not found)', Locked = true;
        IsInitialized: Boolean;
}