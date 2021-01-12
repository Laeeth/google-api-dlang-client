module app;

import client;
import gdrive.drive;
import std.stdio;

int main() {
    Client client = new Client("secret.json");

    Drive drive = new Drive(client);

    auto res = drive.about().get().setFields("*").execute();
    //writeln(res);

    writeln("=====================================\n");

    writeln(res.getUser().getKind());

    writeln("================================\n\n");

    return 0;
}
