codeunit 50101 "jdi TTS Test Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        TestToolHelper: Codeunit "jdi TTS Test Helper";
    begin
        TestToolHelper.Create('DEFAULT', '50100..50199', true);
    end;
}