module gmail.models.smimeinfo;

import std.json;
import std.datetime : SysTime;
import common.common;
import vibe.data.json : optional;

public struct SmimeInfo {
	/** The immutable ID for the SmimeInfo.*/
	private static const string ID = "id";
	string _id;
	mixin(GetterSetter!("string", "SmimeInfo")(ID));

	/** PEM formatted X509 concatenated certificate string (standard base64 encoding). Format used for returning key, which includes public key as well as certificate chain (not private key).*/
	private static const string PEM = "pem";
	string _pem;
	mixin(GetterSetter!("string", "SmimeInfo")(PEM));

	/** When the certificate expires (in milliseconds since epoch).*/
	private static const string EXPIRATION = "expiration";
	string _expiration;
	mixin(GetterSetter!("string", "SmimeInfo")(EXPIRATION));

	/** PKCS#12 format containing a single private/public key pair and certificate chain. This format is only accepted from client for creating a new SmimeInfo and is never returned, because the private key is not intended to be exported. PKCS#12 may be encrypted, in which case encryptedKeyPassword should be set appropriately.*/
	private static const string PKCS12 = "pkcs12";
	string _pkcs12;
	mixin(GetterSetter!("string", "SmimeInfo")(PKCS12));

	/** Whether this SmimeInfo is the default one for this user's send-as address.*/
	private static const string ISDEFAULT = "isDefault";
	bool _isDefault;
	mixin(GetterSetter!("bool", "SmimeInfo")(ISDEFAULT));

	/** The S/MIME certificate issuer's common name.*/
	private static const string ISSUERCN = "issuerCn";
	string _issuerCn;
	mixin(GetterSetter!("string", "SmimeInfo")(ISSUERCN));

	/** Encrypted key password, when key is encrypted.*/
	private static const string ENCRYPTEDKEYPASSWORD = "encryptedKeyPassword";
	string _encryptedKeyPassword;
	mixin(GetterSetter!("string", "SmimeInfo")(ENCRYPTEDKEYPASSWORD));

}
