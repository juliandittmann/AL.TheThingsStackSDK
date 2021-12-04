codeunit 52409 "jdi TTS Default Cluster" implements "jdi TTS IClusterAddress"
{
    Access = Internal;

    procedure GetAPIEndpoint(): Text;
    begin
        Error(NotImplementedErr);
    end;

    procedure GetOAuthEndpoint(): Text
    begin
        Error(NotImplementedErr);
    end;

    var
        NotImplementedErr: Label 'Not implemented';
}