codeunit 50351 "jdi TTS Test Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        TestToolHelper: Codeunit "jdi TTS Test Helper";
    begin
        TestToolHelper.Create('DEFAULT', '50350..50399', true);
    end;
}